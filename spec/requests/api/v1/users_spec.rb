require "rails_helper"

RSpec.describe "Users", type: :request do
  let(:user) { build(:user) }
  let(:headers) { valid_headers.except("Authorization") }
  let(:valid_attributes) do
    attributes_for(:user, password: user.password, password_confirmation: user.password).to_json
  end

  include Docs::V1::Users::Api

  describe "POST api/v1/signup" do
    context "when valid request" do
      before { post "/api/v1/signup", params: valid_attributes, headers: headers }

      include Docs::V1::Users::Create

      it "creates a new user", :dox do
        expect(json["message"]).to match(/Account created successfully/)
        expect(response).to have_http_status(201)
      end

      it "returns an authentication token", :dox do
        expect(json["auth_token"]).not_to be_nil
      end
    end

    context "when invalid request" do
      before { post "/api/v1/signup", params: {}, headers: headers }

      include Docs::V1::Users::Create

      it "does not create a new user", :dox do
        expect(response).to have_http_status(422)
      end

      it "returns failure message", :dox do
        expect(json["message"])
          .to match(/Validation failed: Password can't be blank, Name can't be blank, Email can't be blank, Password digest can't be blank/)
      end
    end
  end
end
