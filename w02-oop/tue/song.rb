require 'pry'

class Song

  def initialize(artist, title)
    test = "#{artist} -> #{title}"
    puts test
    @artist = artist
    @title = title
  end

  def artist
    @artist
  end

  def cookie
    puts "COOKIE COOKIE COOKIE"
  end

  # def get_artist_data
  #   Google.search(self.artist)
  # end

end

class CollabSong < Song
  def initialize(artist, collaborator, title)
    @artist = artist
    @collab = collaborator
    @title = title
  end

  def artist
    "#{@artist} feat. (#{@collab})"
  end

  def cookie
    puts "WHISKEY WHISKEY WHISKEY"
  end
end



binding.pry
