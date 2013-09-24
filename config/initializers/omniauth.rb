Rails.application.config.middleware.use OmniAuth::Builder do
  # The following is for facebook
  #provider :facebook, [APP ID], [SECRET KEY], {scope: 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access'}
  provider :facebook, '352945301507273', '2a2a057c16a26568eac75ef19545b10d'#, {:scope => 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access'}
  #provider :google_oauth2, ENV["GOOGLE_KEY"], ENV["GOOGLE_SECRET"],
  #         {
  #             :name => "google",
  #             :scope => "userinfo.email, userinfo.profile, plus.me, http://gdata.youtube.com",
  #             :prompt => "select_account",
  #             :image_aspect_ratio => "square",
  #             :image_size => 50
  #         }
  #provider :google_oauth2, CLIENT_ID, CLIENT_SECRET, {
  #    access_type: 'offline',
  #    scope: 'userinfo.email,userinfo.profile,plus.me,https://www.googleapis.com/auth/plus.login',
  #    request_visible_actions: 'http://schemas.google.com/AddActivity',
  #    redirect_uri: 'http://localhost/auth/google_oauth2/callback'
  #}
  #provider :twitter, '', ''
  # If you want to also configure for additional login services, they would be configured here.
end