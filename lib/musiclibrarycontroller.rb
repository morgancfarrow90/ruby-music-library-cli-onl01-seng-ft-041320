require 'pry'

class MusicLibraryController

  attr_accessor :music

  def initialize(path = "./db/mp3s")
    @music = MusicImporter.new(path)
    @music.import
  end

  def sorter
    @music.files.sort
  end

  def call
    puts "Welcome to your music library! "
    puts ""
    
    
  end

  def songs
    @sorted_songs.each_with_index do|song, num|
      puts "#{num+1}. #{song}"
    end
  end

  def artists
    Artist.all.each do |artist|
      puts artist.name
    end
  end

  def genres
    Genre.all.each do |genre|
      puts genre.name
    end
  end

  def play_song
    puts "What song number would you like to play?"
    song_num = gets.chomp
    playing_song = @sorted_songs[song_num.to_i - 1]
    puts "Playing #{playing_song}"
  end

  def list_artist
    array = @music.files.collect do |file|
      song = self.class.split_filename(file)
    end
    puts "What artist would you like to list songs for?"
    artist_input = gets.chomp
    artist = Artist.find_by_name(artist_input)
    array.each do |song|
      if song[0] == artist.name
        puts "#{song[0]} - #{song[1]} - #{song[2]}"
      end
    end
  end

  def list_genre
    array = @music.files.collect do |file|
      song = self.class.split_filename(file)
    end
    puts "What genre would you like to list songs for?"
    genre_input = gets.chomp
    genre = Genre.find_by_name(genre_input)
    array.each do |song|
      if song[2] == genre.name
        puts "#{song[0]} - #{song[1]} - #{song[2]}"
      end
    end
  end
end