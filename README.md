# Hannaford Coupons Automation

If you are a frequent shopper at Hannaford, you know it can be time-consuming to scroll through all available coupons and clip them manually. Hannaford offers a lot of coupons every week, some of which are exclusive to your account. However, claiming all the available deals takes a lot of time. This Ruby script automates the process of "clipping" all available coupons at Hannaford's website. It ensures you never miss out on any deals available to your account.

## Prerequisites

Before you can run this script, you'll need to have the following software and accounts set up:

1. **Ruby**: Ensure you have [Ruby](https://www.ruby-lang.org/en/) installed on your system.

2. **Chrome Web Browser**: Make sure you have [Google Chrome](https://www.google.com/chrome/) installed on your computer.

3. **ChromeDriver**: Install [ChromeDriver](https://chromedriver.chromium.org/) by running the following command if you haven't already:

   ```sh
   brew install --cask chromedriver
   ```

4. **Bundler**: If you don't have [Bundler](https://bundler.io/) installed, you can install it using:

   ```sh
   gem install bundler
   ```

5. **Hannaford Account**: You need a [Hannaford](https://www.hannaford.com/) account with a valid email and password to log in.

## Getting Started

1. Clone the repository to your local machine:

   ```sh
   git clone https://github.com/yourusername/hannaford-coupons-automation.git
   ```

2. Navigate to the project directory

   ```sh
   cd hannaford-coupons-automation
   ```

3. Create a `.env` file in the project directory and add your Hannaford login credentials as environment variables:

   ```dotenv
   HANNAFORD_EMAIL=your_email@example.com
   HANNAFORD_PASSWORD=your_password
   ```

4. Install the required Ruby gems using Bundler:

   ```sh
   bundle install
   ```

## Usage

To run the script, execute the following command in the project directory:

```sh
ruby clipper_automation.rb
```

The script will open a Chrome browser, log in to your Hannaford account, close any promotional popup (if it exists), load all available coupons, and clip them. After completing the process, the browser will be closed automatically.

## Troubleshooting

- If you encounter any issues related to ChromeDriver or the Chrome browser, make sure you have the latest versions installed. You can update ChromeDriver with `brew upgrade chromedriver`.

- If the script stops working due to changes in the website's structure, you may need to update the selectors in the script to match the new HTML structure.

- You can create a new issue [here](https://github.com/fm-anderson/hannaford-clipper/issues).
