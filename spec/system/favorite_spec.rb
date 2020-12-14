require 'rails_helper'

RSpec.describe "Favorite", type: :system, js: true do 
  describe "いいね機能" do
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
      page.all(".fa-star-o")[2].click
      fill_in "board_review[title]", with: "testtitle"
      fill_in "board_review[content]", with: "testreview"
      click_on "投稿する"
      find('a', text: 'マイページ').click
      click_on "ログアウト"
    end

    it "いいね機能が正常に動作される" do
      visit new_user_session_path
      fill_in "user[email]", with: "sample@example.com"
      fill_in "user[password]", with: "password"
      click_on "ログインする"
      visit album_board_path(albumboard.id)
      find('.far').click
      expect(page).to have_css '.fas'
      expect(page).to have_content "いいね1件"
      find('.fas').click
      expect(page).to have_css '.far'
      expect(page).to have_content "いいね0件"
    end
  end
end
