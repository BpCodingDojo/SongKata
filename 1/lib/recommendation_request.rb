# require 'song'

class RecommendationRequest

  def self.from_text(text)
    lines = text.split "\n"

    line = lines.shift
    number_of_songs, number_of_recommendations = line.split " "

    songs = []
    lines.each do |line|
      songs << Song.from_text(line)
    end

    new.tap do |request|
      request.requested_recommendations = number_of_recommendations.to_i
      request.songs = songs
    end
  end

  attr_accessor :songs, :requested_recommendations



  def initialize
    @songs = []
  end

end
