 class Song
   
  attr_accessor :name, :artist
  
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
    
  end
  
  def self.all
    @@all
  end 
  
  def save
  @@all << self
  end
  
  def self.create(name)
    @name = self.new(name)
    @name.save
    return @name
  end
  
  def self.destroy_all
    self.all.clear
  end
  
 def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre
    @genre
  end
  
  def genre= (genre)
    @genre = genre
    if @genre.songs.include?(self) == false
     @genre.songs << self
   end
 end
 
 def self.find_by_name(name)
   @@all.detect do |x| x.name == name end
 end
 
 def self.find_or_create_by_name(name)
   find_by_name(name) || self.create(name)
#   ##if find_by_name(name)
#   #find_by_name(name)
#   ##else 
#     new_song = self.create(name)
#     new_song
#   end
 end
end