module Talkie
  module ApplicationHelper
    def link_to_creator(creator, options = {})
      creator_handler = creator.send Talkie.comment_creator_handler
      creator_path = Talkie.creator_path.call(creator, main_app)

      link_to creator_handler, creator_path, options
    end

    def avatar_image_tag(creator)
      creator_handler = creator.send Talkie.comment_creator_handler

      image_tag avatar_url(creator), alt: creator_handler, title: creator_handler
    end

    def avatar_url(creator)
      Talkie.creator_avatar_url.call(creator)
    end
  end
end
