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

  # ==> Mentions support
  # If you decide to enable mentions, be aware on some further configuration
  # The first thing to do is to just enable it:
  #
  # config.enable_mentions = true
  #
  # By default it will send an email to notify the mentioned users
  # but you can override this default configuration like:
  #
  # config.enable_mentions_notifications = false
  #
  # You can override the query that filter the mentionees
  # By default the lambda function is
  # config.mentions_scope_query = lambda { |query| where("email LIKE ?", "#{query}%") }
  # Just keep in mind that the query variable is what you receive when the user
  # types '@' on the textarea, so maybe kurenn@icalialabs.com or so
  # You can change to obey a username column, like so:
  #
  # config.mentions_scope_query = lambda { |query| where("username ILIKE ?", "%#{query}%") }
  #
  # There is another configuration for the mention module you may want to look at it
  # The autocomplete text, which is by default the email, but probably that would look nasty,
  # you can override this and use any method or attribute you want for your talker class:
  #
  # config.autocomplete_mention_display = lambda { |mentionee| mentionee.username }
  #
  # Or maybe something more complex
  # config.autocomplete_mention_display = lambda { |mentionee| "#{mentionee.first_name} #{mentionee.last_name}" }

  # ==> Redirect for comments controller
  # There are sometimes you want to redirect to different locations
  # for the app on success or failure of a comment post,
  # you can easily achieve this through the following configurations
  #
  # The default value for success redirection is:
  # config.success_redirect_to = lambda { |router, commentable| router.polymorphic_path(commentable) }
  # You can override it to anything you want. Inside this lambda function
  # you have access to the main router and the commentable object
  #
  # The default value for failure redirection is:
  # config.fail_redirect_to = lambda { |router| router.url }
  # Inside the comments controller, the redirection would be to go back
  # to the page where the submit came, and if not, it will go to this
  # lambda
end
