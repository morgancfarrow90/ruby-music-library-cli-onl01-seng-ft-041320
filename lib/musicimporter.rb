class MusicImporter
  
  attr_accessor :path
  
  def initialize(file_path)
    @path = file_path
  end
  
  def files
    @path
  end 
  
  def self.import
    
  end
end