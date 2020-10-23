require 'rails_helper'

RSpec.describe ApplicationHelper do
  context 'page_title' do
    it "if given a title" do
      expect(full_title(page_title: "title")).to eq "title - sharemusic"
    end
    it "if the title is empty" do
      expect(full_title(page_title: "")).to eq "sharemusic"
    end
    it "if the title is nil" do
      expect(full_title(page_title: nil)).to eq "sharemusic"
    end
    it "if there are no argument" do
      expect(full_title).to eq "sharemusic"
    end
  end
end
