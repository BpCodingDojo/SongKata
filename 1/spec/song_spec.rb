require_relative "../lib/song"

describe Song do
  describe ".from_text" do
    it "should create a Song with the specified attributes" do
      song_from_text = Song.from_text "4 song_title"

      expect(song_from_text).to be_an_instance_of Song
      expect(song_from_text.title).to eq "song_title"
      expect(song_from_text.number_of_times_played).to eq 4
    end
  end
end
