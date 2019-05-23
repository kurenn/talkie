module Talkie
  class Comment < ActiveRecord::Base
    validates :body, presence: true
  end
end
