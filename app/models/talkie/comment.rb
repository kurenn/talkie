module Talkie
  class Comment < ActiveRecord::Base
    belongs_to :creator, polymorphic: true, inverse_of: :comments

    validates :body, presence: true
  end
end
