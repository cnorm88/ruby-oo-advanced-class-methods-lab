class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    song = self.new
    song.name = name
    all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    new_song = self.find_by_name(name)
    if new_song == nil
        self.create_by_name(name)
    else
        return new_song
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

    def self.new_from_filename(file_name)
    song = self.new
    files = file_name.split(" - ")
    song.artist_name = files[0]
    song.name = files[1].sub(/.mp3/,'')
    song
  end
  
  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    self.all << song
    song  
  end
  
  def self.destroy_all
    self.all.clear
  end

end
