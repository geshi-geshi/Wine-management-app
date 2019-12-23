Rails.application.config.middleware.use OmniAuth::Builder do
	provider :twitter, 
	ENV['TWITTER_CONSUMER_KEY'], 
	ENV['TWITTER_CONSUMER_SECRET']

	provider :facebook, 
	ENV['FACEBOOK_KEY'], 
	ENV['FACEBOOK_SECRET'], scope: 'email', info_fields: 'email, name'

	provider :google_oauth2, 
	ENV['GOOGLE_KEY'], 
	ENV['GOOGLE_SECRET']


end