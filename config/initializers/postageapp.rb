PostageApp.configure do |config|
  config.api_key = 'aqueous-beyond-27541'
  config.recipient_override = 'andrijmessia@gmail.com' unless Rails.env.production?
end
