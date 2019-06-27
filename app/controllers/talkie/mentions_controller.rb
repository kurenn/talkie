# frozen_string_literal: true

module Talkie
  class MentionsController < TalkieController
    def index
      query = params[:q].to_s
      mentionees = current_user.class.where("email LIKE ?", "#{query}%")

      if query.size < 2
        render json: { errors: ['Query string is too short (minimum 2 characters)'] },
               status: :unprocessable_entity
      else
        render json: MentioneesBlueprint.render(mentionees)
      end
    end
  end
end
