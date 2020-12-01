require 'rails_helper'

RSpec.describe "BoardReview", type: :system do
  let!(:user) { FactoryBot.create(:user, email: "test@example.com") }
  let!(:albumboard) { FactoryBot.create(:album_board) }
  let!(:second_albumboard) { FactoryBot.create(:second_album_board) }

  before do
    visit new_user_session_path
    fill_in "user[email]", with: "test@example.com"
    fill_in "user[password]", with: "password"
    click_on "ログインする"
  end

  describe "レビューページ" do
    before do
      visit album_board_path(albumboard.id)
    end

    it "レビューの投稿、マイページに表示、削除できること" do
      click_on "レビューを作成する"
      find('#rating-value', visible: false).set('3')
      fill_in "board_review[title]", with: "testtitle"
      fill_in "board_review[content]", with: "testreview"
      click_on "投稿する"
      expect(page).to have_content "評価: 3/5点"
      expect(page).to have_content "testtitle"
      expect(page).to have_content "testreview"
      expect(page).to have_content "testuser"
      visit user_path(user.id)
      expect(page).to have_content "評価: 3/5点"
      expect(page).to have_content "testtitle"
      expect(page).to have_content "testreview"
      expect(page).to have_content "testuser"
      visit album_board_path(albumboard.id)
      click_on "レビューを削除"
      expect do
        expect(page.accept_confirm).to eq "本当に削除しますか？"
        expect(page).to have_content "レビューを削除しました"
      end
    end

    it "タイトルがないと投稿が出来ないこと" do
      click_on "レビューを作成する"
      find('#rating-value', visible: false).set('3')
      fill_in "board_review[content]", with: "testreview"
      click_on "投稿する"
      expect(page).to have_content "レビューを作成出来ませんでした"
    end

    it "本文がないと投稿出来ないこと" do
      click_on "レビューを作成する"
      find('#rating-value', visible: false).set('3')
      fill_in "board_review[title]", with: "testtitle"
      click_on "投稿する"
      expect(page).to have_content "レビューを作成出来ませんでした"
    end

    it "評価がないと投稿出来ないこと" do
      click_on "レビューを作成する"
      fill_in "board_review[title]", with: "testtitle"
      fill_in "board_review[content]", with: "testreview"
      click_on "投稿する"
      expect(page).to have_content "レビューを作成出来ませんでした"
    end
  end
end
