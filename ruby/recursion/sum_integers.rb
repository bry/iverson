#!/usr/bin/ruby

require 'benchmark'

# Problem: Write a function given an integer and return the sum
# of all integers from 1 to the integer given 

def sum_recursively(num)

  if num == 0
    return num
  end

  return sum_recursively(num-1) + num

end

def sum_iteratively(num)

  sum = 0

  for i in 1..num
    sum = sum + i
  end 

  sum

end

def sum_like_a_boss(num)

  # Gauss sum formula
  return ((1+num)/2)*num

end

# Show method benchmark performance times
Benchmark.bm(7) do |x| 

  puts "Sum recursively" 
  x.report {sum_recursively(100)}

  puts "Sum iteratively" 
  x.report {sum_iteratively(100)}

  puts "Sum using Gauss formula" 
  x.report {sum_like_a_boss(100)}

end

#  "You even look like Carl Friedrich Gauss. 
#  If phrenology were a true science, you'd be Carl Friedrich 
#  Gauss' intellectual equivalent!"
