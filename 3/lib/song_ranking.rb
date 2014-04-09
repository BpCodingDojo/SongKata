class SongRanking
  def initialize(ranked_songs)
    @ranked_songs = ranked_songs
  end

  def take_best(quantity)
    retval = []
    @ranked_songs.
        each_with_index{|song,index| song[:quality] = song[:listened]*(index+1) }.
        sort_by{|song| -1 * song[:quality]}.
        slice(0, quantity).each { |song| retval.push song[:name] }

    retval
  end
end