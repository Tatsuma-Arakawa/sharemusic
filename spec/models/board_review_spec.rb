require 'rails_helper'

RSpec.describe BoardReview, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @albumboard = FactoryBot.create(:album_board)
    @boardreview = @albumboard.board_reviews.build(
      content: "testreview", title: "testtitle", score: 5
    )
    @boardreview.user_id = @user.id
  end

  it "factoryが有効な状態であること" do
    expect(@boardreview).to be_valid
  end

  it "contentが無ければ無効な状態であること" do
    @boardreview.content = nil
    expect(@boardreview.valid?).to eq(false)
  end

  it "contentが空欄の場合無効な状態であること" do
    @boardreview.content = " "
    expect(@boardreview.valid?).to eq(false)
  end

  it "contentが1001文字以上の場合無効な状態であること" do
    @boardreview.content = "a" * 1001
    expect(@boardreview.valid?).to eq(false)
  end

  it "contetnが1000文字以下の場合有効な状態であること" do
    @boardreview.content = "a" * 1000
    expect(@boardreview.valid?).to eq(true)
  end

  it "user_idが無い場合無効な状態であること" do
    @boardreview.user_id = nil
    expect(@boardreview.valid?).to eq(false)
  end

  it "titleがない場合無効な状態であること" do
    @boardreview.title = nil
    expect(@boardreview.valid?).to eq(false)
  end

  it "titleが空欄の場合無効な状態であること" do
    @boardreview.title = " "
    expect(@boardreview.valid?).to eq(false)
  end

  it "titleが101文字以上の場合無効な状態であること" do
    @boardreview.title = "a" * 101
    expect(@boardreview.valid?).to eq(false)
  end

  it "titleが100文字以下の場合有効な状態であること" do
    @boardreview.title = "a" * 100
    expect(@boardreview.valid?).to eq(true)
  end

  it "scoreがない場合無効な状態であること" do
    @boardreview.score = nil
    expect(@boardreview.valid?).to eq(false)
  end
end
