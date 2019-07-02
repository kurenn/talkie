# frozen_string_literal: true

require "rails_helper"
require "pathname"
require "generators/talkie/views_generator"

RSpec.describe Talkie::Generators::ViewsGenerator, type: :generator do
  describe "copy_views" do
    it "is copied to the application" do
      run_generator
      mentiones_html_file = file "app/views/talkie/notifications_mailer/mentioned.html.erb"
      mentiones_text_file = file "app/views/talkie/notifications_mailer/mentioned.text.erb"

      expect(mentiones_html_file).to exist
      expect(mentiones_text_file).to have_correct_syntax
      expect(Pathname.new('app/views/talkie/notifications_mailer')).to be_directory
    end
  end
end
