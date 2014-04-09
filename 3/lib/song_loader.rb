# require 'file'

class SongLoader
  def initialize file_name
    File.open(file_name, 'r').each_line do |line|
      continue if read_first_line line

    end
  end

  def best
    0
  end

  private

  def read_first_line line

  end
end