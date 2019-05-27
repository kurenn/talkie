module Talkie
  class Comment < ActiveRecord::Base
    belongs_to :creator, polymorphic: true, inverse_of: :comments
    belongs_to :commentable, polymorphic: true, inverse_of: :comments

    validates :body, :creator, presence: true
  end
end
