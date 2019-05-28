module Talkie
  class Comment < ActiveRecord::Base
    acts_as_nested_set :scope => [:commentable_id, :commentable_type],
                       :counter_cache => :children_count

    belongs_to :creator, polymorphic: true, inverse_of: :comments
    belongs_to :commentable, polymorphic: true, inverse_of: :comments

    validates :body, :creator, :commentable, presence: true
  end
end
