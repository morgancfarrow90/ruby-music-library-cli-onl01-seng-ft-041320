module Concerns::Findable

def find_by_name(name)
   self.all.detect do |x| x.name == name end
 end
 end

end