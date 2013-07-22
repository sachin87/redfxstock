# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Redfxstock::Application.initialize!

config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => 'gmail.com',
    :user_name            => ENV['EMAIL'],
    :password             => ENV['PASSWORD'],
    :authentication       => 'plain'
}