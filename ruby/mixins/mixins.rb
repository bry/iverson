#!/usr/bin/ruby

# Debug module
module Debug
  def whoAmI?
    "#{self.class.name} {\##{self.object_id}): #{self.to_s}"
  end
end

# Mixin Debug module using 'include'
class Phonograph
  include Debug

  def initialize(name)
    @name = name 
  end
end

class EightTrack
  include Debug

  def initialize(name)
    @name = name
  end
end

ph = Phonograph.new("west End Blues")
et = EightTrack.new("Surrealistic Pillow")

puts ph.whoAmI? 
puts et.whoAmI?
