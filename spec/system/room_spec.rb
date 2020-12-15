require 'rails_helper'

RSpec.describe "Room", type: :system do
  describe "DM機能" do
    let!(:user) { FactoryBot.create(:user, email: "test@example.com") }
    let!(:second_user) { FactoryBot.create(:user, email: "sample@example.com") }
    let!(:room) { FactoryBot.create(:room) }
    let!(:entry) { FactoryBot.create(:entry, user_id: user.id, room_id: room.id) }
    let!(:second_entry) { FactoryBot.create(:entry, user_id: second_user.id, room_id: room.id) }

    before do
      visit new_user_session_path
      fill_in "user[email]", with: "test@example.com"
      fill_in "user[password]", with: "password"
      click_on "ログインする"
      visit room_path(room.id)
    end

    it "メッセージが正常に保存され、削除することができる" do
      fill_in "message[content]", with: "hello"
      click_on "送信"
      expect(page).to have_content "hello"
      click_on "削除"
      expect do
        expect(page.accept_confirm).to eq "本当に削除しますか？"
        expect(page).to have_content "メッセージを削除しました"
      end
    end
  end
end
