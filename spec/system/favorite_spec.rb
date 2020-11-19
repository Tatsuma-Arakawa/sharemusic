require 'rails_helper'

RSpec.describe "Favorite", type: :system, js: true, retry: 5 do
  xscenario "いいね機能" do
    let!(:user) { FactoryBot.create(:user, email: "test@example.com") }
    let!(:second_user) { FactoryBot.create(:user, email: "sample@example.com") }
    let!(:albumboard) { FactoryBot.create(:album_board) }

    before do
      visit new_user_session_path
      fill_in "user[email]", with: "test@example.com"
      fill_in "user[password]", with: "password"
      click_on "ログインする"
      visit album_board_path(albumboard.id)
      click_on "レビューを作成する"
      find('#rating-value', visible: false).set('3')
      fill_in "board_review[title]", with: "testtitle"
      fill_in "board_review[content]", with: "testreview"
      click_on "投稿する"
      click_on "ログアウト"
    end

    it "いいね機能が正常に動作される" do
      visit new_user_session_path
      fill_in "user[email]", with: "sample@example.com"
      fill_in "user[password]", with: "password"
      click_on "ログインする"
      visit album_board_path(albumboard.id)
      find('.far-link').click
      wait_for_ajax
      expect(page).to have_content "いいね1件"
    end
  end
end
