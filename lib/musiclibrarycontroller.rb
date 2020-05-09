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
    puts "Welcome to your music library!"
  end

 
end