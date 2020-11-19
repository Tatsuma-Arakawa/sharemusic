require 'rails_helper'

RSpec.describe "AlbumBoards", type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:second_user) { FactoryBot.create(:user, email: "sample@example.com") }
  let!(:albumboard) { FactoryBot.create(:album_board) }
  describe "GET/album_boards" do
    before do
      sign_in user
      get album_boards_path
    end

    it "リクエストが成功する" do
      expect(response).to have_http_status "200"
    end

    it "アルバム名が表示される" do
      expect(response.body).to include albumboard.albums
    end
  end

  describe "GET/album_board" do
    before do
      sign_in user
      get album_board_path(albumboard.id)
    end

    it "リクエストが成功する" do
      expect(response).to have_http_status "200"
    end

    it "アルバム名が表示される" do
      expect(response.body).to include albumboard.albums
    end
  end
end
