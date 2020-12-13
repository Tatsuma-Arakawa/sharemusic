require 'rails_helper'

RSpec.describe Entry, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  it "factoryが有効な状態であること" do
    expect(@message).to be_valid
  end

  it "contentが無ければ無効な状態であること" do
    @message.content = nil
    expect(@message.valid?).to eq(false)
  end

  it "contentが空欄の場合無効な状態であること" do
    @message.content = " "
    expect(@message.valid?).to eq(false)
  end

  it "contentが1001文字以上の場合無効な状態であること" do
    @message.content = "a" * 1001
    expect(@message.valid?).to eq(false)
  end

  it "contetnが1000文字以下の場合有効な状態であること" do
    @message.content = "a" * 1000
    expect(@message.valid?).to eq(true)
  end
end
