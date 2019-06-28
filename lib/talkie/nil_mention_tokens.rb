# frozen_string_literal: true

module Talkie
  class NilMentionTokens

    def self.find(ids = [])
      []
    end

    def to_s
      %Q{#{[
        {
          type: self.class.to_s
        }
      ].to_json}}
    end
  end
end
