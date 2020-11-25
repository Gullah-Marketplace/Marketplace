FreshdeskRails.configure do |config|
  config.default_locale = :en
  # list your help desks with locales.
  config.urls = {
      'en' => 'http://gullahmarketplace.freshdesk.com'
  }
end
