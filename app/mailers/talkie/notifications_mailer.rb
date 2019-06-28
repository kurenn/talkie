# frozen_string_literal: true

module Talkie
  class NotificationsMailer < ActionMailer::Base
    default from: Talkie.from_mailer_address

    def mentioned
      @comment = params[:comment]
      @creator = @comment.creator
      recipients = params[:recipients]
      mail to: recipients,
           subject: t("talkie.mailers.notifications.subject", creator: @creator.email)
    end
  end
end
