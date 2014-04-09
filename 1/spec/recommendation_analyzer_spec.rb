require_relative "../lib/recommendation_analyzer"
require_relative "../lib/recommendation_request"

describe RecommendationAnalyzer do

  describe "#result" do
    context "when request is empty" do
      it "should return empty array" do
        analyzer = RecommendationAnalyzer.new RecommendationRequest.new

        expect(analyzer.result).to be_empty
      end
    end

    it "should return all songs if request contains only 1 song" do
      song = Song.new
      song.title = "song_title"
      request = RecommendationRequest.new
      request.songs = [song]
      analyzer = RecommendationAnalyzer.new request

      expect(analyzer.result).to eq request.songs
    end
  end
  
end
