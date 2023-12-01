require 'dotenv/load'
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.default_driver = :selenium
Capybara.run_server = false
include Capybara::DSL

visit("https://www.hannaford.com/coupons")

if page.has_link?('sign in')
  click_link('sign in')
  fill_in('userNameLogin', with: ENV['HANNAFORD_EMAIL'])
  fill_in('passwordLogin', with: ENV['HANNAFORD_PASSWORD'])
  find('div#loginCred button.btn-primary').click
  sleep 5
end

if page.has_css?('#fsrFocusFirst')
  find('#fsrFocusFirst').click
  sleep 2
end

def scroll_to_bottom
  execute_script("window.scrollTo(0, document.body.scrollHeight);")
end

while true
  current_coupon_count = all('.clipTarget').count
  scroll_to_bottom
  sleep 2
  new_coupon_count = all('.clipTarget').count

  break if current_coupon_count == new_coupon_count
end

all('.clipTarget').each do |coupon|
  Capybara.using_wait_time(10) do
    coupon.click rescue Selenium::WebDriver::Error::ElementClickInterceptedException
  end
  execute_script("arguments[0].click();", coupon.native) rescue Capybara::ElementNotFound
end

Capybara.current_session.driver.quit