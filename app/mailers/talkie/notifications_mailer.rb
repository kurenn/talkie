# frozen_string_literal: true

module Talkie
  class NotificationsMailer < ActionMailer::Base
    default from: "from@example.com"

    def mentioned
      @comment = params[:comment]
      @creator = @comment.creator
      recipients = params[:recipients]
      mail(to: recipients, subject: "You have been mentioned by #{@creator.email}")
    end
  end
end
