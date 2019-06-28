# frozen_string_literal: true

require "rails_helper"
require "support/mock_calls"

RSpec.describe Talkie::MentionsController, type: :controller do
  routes { Talkie::Engine.routes }
  let(:user) { DummyUser.create(email: "test@test.com", username: "test") }

  context "when there is no user logged in" do
    before do
      sign_out
    end

    it "won't have access" do
      get :index, params: { q: "ku" }

      expect(response).to have_http_status(:unauthorized)
    end
  end

  context "when there is a user logged in" do
    before do
      sign_in user
    end

    it "render a mentionee json response" do
      get :index, params: { q: "tes" }
      expected_json_response = [
        {
          id: user.id,
          email: user.email,
          name: user.username,
          type: user.class.to_s
        }
      ].to_json

      expect(response.body).to eq expected_json_response
    end

    context "when the q param is too short" do
      it "returns a json error log" do
        get :index, params: { q: "t" }
        expected_json_response = {
          error: "Query string is too short (minimum 2 characters)",
        }.to_json

        expect(response.body).to eq expected_json_response
      end

      it "returns an unprocessable_entity status" do
        get :index, params: { q: "t" }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
