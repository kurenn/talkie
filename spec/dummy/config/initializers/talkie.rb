# frozen_string_literal: true

# Use this hook to configure talkie options for comments scope, creator info and so forth.
# Some configurations are set on the view, check https://github.com/kurenn/talkie for more
# information
Talkie.configure do |config|
  # ==> Default comments scope configuration
  # Configure the default_scope to use by Talkie::Comment class
  # Notice you need to set it to a lambda function
  # config.default_comments_scope = -> { order(created_at: :desc) }


  # ==> Comment creator handler
  # Configure the text to display on the creator for each comment
  # By default it will use the email
  # You can set this to a method on your model, or a simple attribute
  # config.comment_creator_handler = :email

  # ==> Creator path
  # Configure the path to redirect to on the creator link for each comment
  # By default it will use a '#'
  # Notice you need to set it to a lambda function, which receives:
  # a user and the router, both arguments are necessary
  # Here is a quick example on how you may want to configure it
  # config.creator_path = lambda { |user, router| router.user_path(user) }
  # or
  # config.creator_path = lambda { |user, router| router.profile_path(user) }
  #
  # The default looks like:
  # config.creator_path = lambda { |user, router| "#" }


  # ==> Creator avatar url
  # Configure the avatar url for the comment creator
  # By default it will use a http:////api.adorable.io/avatars/40/abott@adorable.png
  # Notice you need to set it to a lambda function, which receives:
  # a user which is mandatory
  # Here is a quick example on how you may want to configure it
  # config.creator_avatar_url = lambda { |user| user.profile_image_url(:thumb) }
  # or
  # config.creator_avatar_url = lambda { |user| user.avatar(:thumb) }
  # Make sure you return a string
  #
  # The default looks like:
  # config.creator_avatar_url = lambda { |user| "//api.adorable.io/avatars/40/abott@adorable.png" }

  config.enable_mentions = true
  config.autocomplete_mention_display = lambda { |mentionee| mentionee.username }
end
