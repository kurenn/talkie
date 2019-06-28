# frozen_string_literal: true

module Talkie
  class MentionsController < TalkieController
    def index
      if query.size < 2
        render json: { error: 'Query string is too short (minimum 2 characters)' },
                       status: :unprocessable_entity
      else
        render json: MentioneesBlueprint.render(mentionees)
      end
    end

    private

    def query
      @query ||= params[:q].to_s
    end

    def mentionees
      @mentionees ||= current_user.class.mentionees(query)
    end
  end
end
