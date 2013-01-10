#!/usr/bin/ruby

# Let the bass bump, Rubystyyy 
triple_beat = 0 

while(true)
  if((triple_beat % 6) == 0)
    sleep(0.4)
    puts "\a"
    sleep(0.18)
    puts "\a"
    sleep(0.18)
    puts "\a"
    triple_beat = 0
  end

  sleep(0.4)
  puts "\a"

  triple_beat = triple_beat + 1
end
