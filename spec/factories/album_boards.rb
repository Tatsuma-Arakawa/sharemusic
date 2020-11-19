FactoryBot.define do
  factory :album_board do
    albums { "testalbum" }
    icon   { "test1.jpg" }
  end

  factory :second_album_board, class: "AlbumBoard" do
    albums { "samplealbum" }
    icon   { "test2.jpg" }
  end
end
