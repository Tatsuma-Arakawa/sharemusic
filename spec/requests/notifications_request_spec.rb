require 'rails_helper'

RSpec.describe "Notifications", type: :request do
  let!(:user) { FactoryBot.create(:user) }
  describe "GET/notifications/index" do
    before do
      sign_in user
      get notifications_index_path
    end

    it "リクエストが成功する" do
      expect(response).to have_http_status "200"
    end
  end
end
