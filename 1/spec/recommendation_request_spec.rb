require_relative "../lib/recommendation_request"

describe RecommendationRequest do
  describe ".from_text" do

    it "should create a RecommendationRequest" do
      expect(RecommendationRequest.from_text "0 0").to be_instance_of RecommendationRequest
    end

    it "should parse the number of songs when there are 0 songs" do
      expect(RecommendationRequest.from_text("0 0").songs.count).to eq 0
    end

    it "should parse the songs" do
      text = "1 0\n20 name\n30 another"

      expect(RecommendationRequest.from_text(text).songs.count).to eq 2
      expect(RecommendationRequest.from_text(text).songs.first.title).to eq "name"
    end

    it "should parse the number of requested songs" do
      expect(RecommendationRequest.from_text("0 5").requested_recommendations).to eq 5
    end

  end
end
