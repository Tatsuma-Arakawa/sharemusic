require 'rails_helper'

RSpec.describe "BoardReviews", type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:albumboard) { FactoryBot.create(:album_board) }
  let!(:boardreview) { create(:board_review, content: "testreview", title: "testtitle", score: "5", user_id: user.id, album_board_id: albumboard.id) }

  describe "GET/album_board" do
    before do
      sign_in user
      get album_board_path(albumboard.id)
    end

    it "リクエストが成功する" do
      expect(response).to have_http_status "200"
    end

    it "タイトルが表示される" do
      expect(response.body).to include boardreview.title
    end

    it "本文が表示される" do
      expect(response.body).to include boardreview.content
    end

    it "scoreが表示される" do
      expect(response.body).to include boardreview.score.to_s
    end

    it "投稿者のusernameが表示される" do
      expect(response.body).to include boardreview.user.username
    end
  end
end
