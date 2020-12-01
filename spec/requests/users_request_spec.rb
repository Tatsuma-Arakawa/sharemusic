require 'rails_helper'
RSpec.describe "Users", type: :request do
  let!(:user) { FactoryBot.create(:user, email: "test@example.com", introduce: "testintroduce") }
  let!(:second_user) { FactoryBot.create(:user, email: "sample@example.com", introduce: "sampleintroduce") }
  describe "GET/users/search" do
    before do
      sign_in user
      get search_users_path
    end

    it "リクエストが成功する" do
      expect(response).to have_http_status "200"
    end

    it "usernameが表示される" do
      expect(response.body).to include second_user.username
    end

    it "introduceが表示される" do
      expect(response.body).to include second_user.introduce
    end
  end

  describe "GET/user" do
    before do
      sign_in user
      get user_path(user.id)
    end

    it "リクエストが成功する" do
      expect(response).to have_http_status "200"
    end

    it "usernameが表示される" do
      expect(response.body).to include user.username
    end

    it "introduceが表示される" do
      expect(response.body).to include user.introduce
    end
  end
end
