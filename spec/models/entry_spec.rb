require 'rails_helper'

RSpec.describe Entry, type: :model do
  before do
    @entry = FactoryBot.build(:entry)
  end

  it "factoryが有効な状態であること" do
    expect(@entry).to be_valid
  end
end
