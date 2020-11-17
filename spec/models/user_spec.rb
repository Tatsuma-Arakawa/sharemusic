require 'rails_helper'

RSpec.describe User, type: :model do
  it "factoryが有効な状態であること" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "usernameが無ければ無効な状態であること" do
    user = FactoryBot.build(:user, username: nil)
    expect(user.valid?).to eq(false)
  end

  it "usernameが空欄の場合無効な状態であること" do
    user = FactoryBot.build(:user, username: " ")
    expect(user.valid?).to eq(false)
  end

  it "usernameが21文字以上の場合無効な状態であること" do
    user = FactoryBot.build(:user, username: "a" * 21)
    expect(user.valid?).to eq(false)
  end

  it "メールアドレスが無ければ無効な状態であること" do
    user = FactoryBot.build(:user, email: nil)
    expect(user.valid?).to eq(false)
  end

  # it "重複したメールアドレスなら無効な状態であること" do
  # FactoryBot.create(:user)
  # user = FactoryBot.build(:user, email: "tester1@example.com")
  # expect(user.valid?).to eq(false)
  # end

  it "passwordが無ければ無効な状態であること" do
    user = FactoryBot.build(:user, password: nil)
    expect(user.valid?).to eq(false)
  end

  it "passwordが5文字以下の場合無効な状態であること" do
    user = FactoryBot.build(:user, password: "a" * 5)
    expect(user.valid?).to eq(false)
  end

  it "introduceが256文字以上の場合無効な状態であること" do
    user = FactoryBot.build(:user, introduce: "a" * 256)
    expect(user.valid?).to eq(false)
  end

  it "introduceが255文字以下の場合有効な状態であること" do
    user = FactoryBot.build(:user, introduce: "a" * 255)
    expect(user.valid?).to eq(true)
  end
end
