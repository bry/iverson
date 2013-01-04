#!/usr/bin/ruby

# Ruby blocks

def kanye_raps &block

  for i in 0..1 
    if block
      yield
    end
  end    

  puts "Ain't it Jay?"

end

def jay_z_raps &block
  if block
    yield
  end
end


kanye_raps {puts "That shit cray"}
jay_z_raps {puts "Ball so hard"}
