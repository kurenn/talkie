# frozen_string_literal: true

class MentioneesBlueprint < Blueprinter::Base
  identifier :id

  fields :email

  field :type do |mentionee, _|
    "#{mentionee.class.to_s}"
  end

  field :name do |mentionee, _|
    "#{Talkie.autocomplete_mention_display.call(mentionee)}"
  end
end
