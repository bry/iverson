#!/usr/bin/ruby

# Problem: Determine if a number is prime

def prime?(number)
  prime(number, Math.sqrt(number).to_i)
end

def prime(number,square_root)

  if square_root < 2
    return true
  elsif number % square_root == 0
    return false 
  end
  
  prime(number, square_root - 1)
end

puts "Is 11 prime? " + prime?(11).to_s
puts "Is 12 prime? " + prime?(12).to_s
puts "Is 24 prime? " + prime?(24).to_s
puts "Is 25 prime? " + prime?(25).to_s
puts "Is 23 prime? " + prime?(23).to_s
