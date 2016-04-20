# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

if Rails.env.development?
    ActionMailer::Base.delivery_method = :smtp #added to try and fix error
    ActionMailer::Base.smtp_settings = {
    
        :address => 'smtp.gmail.com',
        :port => '2525',
        :domain => 'heroku.com',
        :user_name => ENV['GMAIL_USERNAME'],
        :password => ENV['GMAIL_PASSWORD'],
        :authentication => :plain,
        :enable_starttls_auto => true
    
    }
    
else
    
    ActionMailer::Base.smtp_settings = {
    
        :address => 'smtp.sendgrid.net',
        :port => '2525',
        :domain => 'heroku.com',
        :user_name => ENV['SENDGRID_USERNAME'],
        :password => ENV['SENDGRID_PASSWORD'],
        :authentication => :plain,
        :enable_starttls_auto => true
    
    }
end
