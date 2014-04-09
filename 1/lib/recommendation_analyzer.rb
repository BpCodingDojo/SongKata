class RecommendationAnalyzer

  def initialize(request)
    @request = request
  end



  def result
    @request.songs
  end

end
