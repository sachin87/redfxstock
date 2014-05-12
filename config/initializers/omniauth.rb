Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
           :scope => 'email,user_birthday,read_stream', :display => 'popup'
  provider :twitter, ENV["TWITTER_KEY"], ENV["TWITTER_SECRET"],
           {
               :secure_image_url => 'true',
               :image_size => 'original',
               :authorize_params => {
                   :force_login => 'true',
                   :lang => 'pt'
               }
           }
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"],
           {
               :name => "google",
               :scope => "email, profile, plus.me, http://gdata.youtube.com",
               :prompt => "select_account",
               :image_aspect_ratio => "square",
               :image_size => 50
           }
  provider :linkedin, ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET'],
           :scope => 'r_fullprofile r_emailaddress r_network'
end