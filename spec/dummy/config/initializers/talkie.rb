Talkie.configure do |config|
  config.creator_path = lambda { |user, router| router.dummy_user_path(user) }
end
