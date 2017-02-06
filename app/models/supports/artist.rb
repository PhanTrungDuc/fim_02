class Supports::Artist
  attr_reader :artist, :songs, :albums

  def initialize songs, albums
    @songs = songs
    @albums = albums
    @artist = artist
  end

  def load_albums artist
    @albums ||= Album.belongs_to_artist artist.id
  end

  def load_songs artist
    @songs ||= Song.where artist_id: artist.id
  end

  def type_of_musics
    @type_of_musics ||= Artist.type_of_musics.keys
  end

  def artist_types
    @artist_types ||= Artist.artist_types.keys
  end
end
