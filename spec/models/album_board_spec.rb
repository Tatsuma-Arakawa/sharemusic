require 'rails_helper'

RSpec.describe AlbumBoard, type: :model do
  before do
    @albumboard = FactoryBot.build(:album_board)
  end

  it "factoryが有効な状態であること" do
    expect(@albumboard).to be_valid
  end

  it "albumsが無ければ無効な状態であること" do
    @albumboard.albums = nil
    expect(@albumboard.valid?).to eq(false)
  end

  it "albumsが空欄の場合無効な状態であること" do
    @albumboard.albums = " "
    expect(@albumboard.valid?).to eq(false)
  end

  it "重複したalbumsは無効であること" do
    FactoryBot.create(:album_board, albums: "testalbum")
    @albumboard.albums = "testalbum"
    expect(@albumboard.valid?).to eq(false)
  end
end
