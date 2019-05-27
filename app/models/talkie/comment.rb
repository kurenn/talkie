module Talkie
  class Comment < ActiveRecord::Base
    belongs_to :creator, polymorphic: true, inverse_of: :comments
    belongs_to :commentable, polymorphic: true, inverse_of: :comments

    validates :body, :creator, :commentable, presence: true
  end
end
