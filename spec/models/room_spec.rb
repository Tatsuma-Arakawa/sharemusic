require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  it "factoryが有効な状態であること" do
    expect(@room).to be_valid
  end
end