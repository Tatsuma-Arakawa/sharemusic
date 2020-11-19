require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe "GET /users/sign_in" do
    it "ログイン画面が表示されること" do
      get new_user_session_path
      expect(response).to have_http_status(200)
    end
  end
end
