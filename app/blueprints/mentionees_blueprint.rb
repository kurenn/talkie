# frozen_string_literal: true

class MentioneesBlueprint < Blueprinter::Base
  identifier :id

  fields :email, :username

  field :type do |mentionee, _|
    "#{mentionee.class.to_s.downcase}"
  end

  field :name do |mentionee, _|
    "#{mentionee.username}"
  end
end
