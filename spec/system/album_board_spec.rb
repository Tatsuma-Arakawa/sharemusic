require 'rails_helper'

RSpec.describe "AlbumBoard", type: :system do
  let!(:user) { FactoryBot.create(:user, email: "test@example.com") }
  let!(:albumboard) { FactoryBot.create(:album_board) }
  let!(:second_albumboard) { FactoryBot.create(:second_album_board) }

  before do
    visit new_user_session_path
    fill_in "user[email]", with: "test@example.com"
    fill_in "user[password]", with: "password"
    click_on "ログインする"
  end

  describe "レビューページ検索画面" do
    before do
      visit album_boards_path
    end

    it "アルバム名を検索すると該当のアルバムのみが表示されること" do
      fill_in "q[albums_cont]", with: "testalbum"
      click_on "アルバム検索"
      expect(page).to have_content "testalbum"
      expect(page).not_to have_content "samplealbum"
    end

    it "検索をしないとアルバム一覧が表示されること" do
      expect(page).to have_content "testalbum"
      expect(page).to have_content "samplealbum"
    end

    it "空欄で検索した場合アルバム一覧が表示されること" do
      fill_in "q[albums_cont]", with: " "
      click_on "アルバム検索"
      expect(page).to have_content "testalbum"
      expect(page).to have_content "samplealbum"
    end

    it "アルバムをクリックするとレビューが表示されること" do
      click_on "testalbum"
      expect(current_path).to eq album_board_path(albumboard.id)
      expect(page).to have_content "testalbum"
    end
  end

  describe "アルバム検索画面" do
    before do
      visit search_album_boards_path
    end

    it "検索に関連するアルバムが表示されること" do
      fill_in "search", with: "The Beatles"
      click_on "アルバム検索"
      expect(page).to have_content "Abbey Road"
    end
  end

  describe "レビューページ一覧" do
    before do
      visit root_path
    end

    it "ログイン後はroot_pathにレビューページ一覧が表示されること" do
      expect(page).to have_content "testalbum"
      expect(page).to have_content "samplealbum"
    end

    it "アルバムをクリックするとレビューが表示されること" do
      click_on "testalbum"
      expect(current_path).to eq album_board_path(albumboard.id)
      expect(page).to have_content "testalbum"
    end
  end
end
