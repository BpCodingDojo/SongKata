class Song

  def self.from_text(text)
    number_of_times_played, title = text.split " "
    new.tap do |song|
      song.title = title
      song.number_of_times_played = number_of_times_played.to_i
    end
  end



  attr_accessor :title, :number_of_times_played

end
