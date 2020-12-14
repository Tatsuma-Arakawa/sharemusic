require 'rails_helper'

RSpec.describe "Notification", type: :system, js: true do 
  let!(:user) { FactoryBot.create(:user, email: "test@example.com", username: "testuser") }
  let!(:second_user) { FactoryBot.create(:user, email: "sample@example.com", username: "sampleuser") }
  let!(:room) { FactoryBot.create(:room) }
  let!(:entry) { FactoryBot.create(:entry, user_id: user.id, room_id: room.id) }
  let!(:second_entry) { FactoryBot.create(:entry, user_id: second_user.id, room_id: room.id) }
  let!(:albumboard) { FactoryBot.create(:album_board) }

  describe "DM機能" do
    before do
      visit new_user_session_path
      fill_in "user[email]", with: "test@example.com"
      fill_in "user[password]", with: "password"
      click_on "ログインする"
      visit room_path(room.id)
      fill_in "message[content]", with: "hello"
      click_on "送信"
      find('a', text: 'マイページ').click
      click_on "ログアウト"
      visit new_user_session_path
      fill_in "user[email]", with: "sample@example.com"
      fill_in "user[password]", with: "password"
      click_on "ログインする"
    end

    it "DMの通知がきている" do
      expect(page).to have_content "1件の新規通知"
      click_on "1件の新規通知"
      expect(page).to have_content "testuserさんが あなたにメッセージ を送りました"
    end
  end

  describe "いいね機能" do
    before do
      visit new_user_session_path
      fill_in "user[email]", with: "test@example.com"
      fill_in "user[password]", with: "password"
      click_on "ログインする"
      visit album_board_path(albumboard.id)
      click_on "レビューを作成する"
      page.all(".fa-star-o")[2].click
      fill_in "board_review[title]", with: "testtitle"
      fill_in "board_review[content]", with: "testreview"
      click_on "投稿する"
      find('a', text: 'マイページ').click
      click_on "ログアウト"
      visit new_user_session_path
      fill_in "user[email]", with: "sample@example.com"
      fill_in "user[password]", with: "password"
      click_on "ログインする"
      visit album_board_path(albumboard.id)
      find('.far').click
      find('a', text: 'マイページ').click
      click_on "ログアウト"
      visit new_user_session_path
      fill_in "user[email]", with: "test@example.com"
      fill_in "user[password]", with: "password"
      click_on "ログインする"
    end

    it "いいねの通知がきている" do
      expect(page).to have_content "1件の新規通知"
      click_on "1件の新規通知"
      expect(page).to have_content "sampleuserさんが あなたのレビュー にいいねしました"
    end
  end

  describe "フォロー機能" do
    before do
      visit new_user_session_path
      fill_in "user[email]", with: "test@example.com"
      fill_in "user[password]", with: "password"
      click_on "ログインする"
      visit user_path(second_user.id)
      click_on "フォロー"
      find('a', text: 'マイページ').click
      click_on "ログアウト"
      visit new_user_session_path
      fill_in "user[email]", with: "sample@example.com"
      fill_in "user[password]", with: "password"
      click_on "ログインする"
    end

    it "フォローの通知がきている" do
      expect(page).to have_content "1件の新規通知"
      click_on "1件の新規通知"
      expect(page).to have_content "testuserさんが あなたをフォローしました"
    end
  end
end
