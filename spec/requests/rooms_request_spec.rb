require 'rails_helper'

RSpec.describe "Rooms", type: :request do
  let!(:user) { FactoryBot.create(:user, email: "test@example.com") }
  let!(:second_user) { FactoryBot.create(:user, email: "sample@example.com") }
  let!(:room) { FactoryBot.create(:room) }
  let!(:entry) { FactoryBot.create(:entry, user_id: user.id, room_id: room.id) }
  let!(:second_entry) { FactoryBot.create(:entry, user_id: second_user.id, room_id: room.id) }
  let!(:message) { FactoryBot.create(:message, user_id: user.id, room_id: room.id, content: "テストメッセージ") } 
  describe "GET/rooms/show" do
    before do
      sign_in user
      get room_path(room.id)
    end

    it "リクエストが成功する" do
      expect(response).to have_http_status "200"
    end

    it "メッセージが表示される" do
      expect(response.body).to include message.content
    end

    it "usernameが表示される" do
      expect(response.body).to include user.username
      expect(response.body).to include second_user.username
    end
  end
end