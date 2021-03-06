require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    song = Song.new.save
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    self.new_by_name(name).save
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(name)
    song = self.new
    song.artist_name, song.name = name.chomp(".mp3").split(" - ")
    song
  end

  def self.create_from_filename(name)
    self.new_from_filename(name).save
  end

  def self.destroy_all
    self.all.clear
  end

end

  #try refactoring this so, instead of repeating the logic from above, just add save
  # def self.create_by_name(name)
  #   song = self.new
  #   song.name = name
  #   song.save
  #   song
  # end

  # def self.find_or_create_by_name(name)
  #   if self.find_by_name(name) == nil
  #     self.create_by_name(name)
  #   else
  #     self.find_by_name(name)
  #   end
  # end

  # def self.new_from_filename(name)
  #   name.delete_suffix!(".mp3")
  #   song_info = name.split(" - ")
  #   @song = self.new
  #   @song.artist_name = song_info[0]
  #   @song.name = song_info[1]
  #   @song
  # end

  # def self.create_from_filename(name)
  #   name.delete_suffix!(".mp3")
  #   song_info = name.split(" - ")
  #   @song = self.new
  #   @song.artist_name = song_info[0]
  #   @song.name = song_info[1]
  #   @song.save
  # end

