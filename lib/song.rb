class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    new_song = self.new_by_name(song_name)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by do|song|
      song.name.downcase
    end
  end

  def self.new_from_filename(file_name)
    file_array = file_name.split(" - ")
    song_artist = file_array[0]
    song_name = file_array[1].gsub(".mp3","")
    song = self.new
    song.name = song_name
    song.artist_name = song_artist
    song
  end

  def self.create_from_filename(file_name)
    new_song = self.new_from_filename(file_name)
    new_song.save
  end

  def self.destroy_all
    @@all = []
  end

  def save
    self.class.all << self
  end
end
