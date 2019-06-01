module Talkie
  module ApplicationHelper
    def link_to_creator(creator, options = {})
      creator_handler = creator.send Talkie.comment_creator_handler
      creator_path = Talkie.creator_path.call(creator, main_app)

      link_to creator_handler, creator_path, options
    end
  end
end
