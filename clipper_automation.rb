require 'dotenv/load'
require 'watir'

browser = Watir::Browser.new :chrome

browser.goto("https://www.hannaford.com/coupons")

# check if logged in.
if browser.link(text: 'sign in').exists?
  browser.link(text: 'sign in').click
  browser.text_field(id: 'userNameLogin').set(ENV['HANNAFORD_EMAIL'])
  browser.text_field(id: 'passwordLogin').set(ENV['HANNAFORD_PASSWORD'])
  browser.button(text: 'Sign In').click
  sleep 5
end

# load all coupons
loop do
  current_height = browser.execute_script("return document.body.scrollHeight")
  browser.execute_script("window.scrollTo(0, #{current_height});")
  sleep 2
  new_height = browser.execute_script("return document.body.scrollHeight")
  break if new_height == current_height
end

# clip all coupons
coupon_links = browser.links(id: /clipTarget_.*/)
coupon_links.each do |coupon_link|
  coupon_link.click
end

browser.close
