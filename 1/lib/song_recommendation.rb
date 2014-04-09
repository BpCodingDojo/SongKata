class SongRecommendation

  def initialize(input_file_name)
    @input_file_name = input_file_name
  end



  def display_result
    RecommendationAnalyzer.new(fetch_request).result.each { |song| puts song.title }
  end



  private

  def fetch_request
    request_text = File.read @input_file_name
    RecommendationRequest.from_text request_text
  end

end
