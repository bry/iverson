#!/usr/bin/ruby

require 'set'

word = "racecar"

palindrome_count = 0
count = 0

# Find all substrings of a string
length = word.length
substrings = Set.new

sublen = length - 2

sublen.times do |x|

  times = 2 + x
  times.times do |y|
    newword = word[y..(sublen-x+y)]
    substrings.add(newword)
  end 
end

palindromes = []

# Check for palindromes
substrings.each do |substring|

  if substring == substring.reverse
    count = count + 1
    palindromes << substring
  end
end

puts "The number of substrings that are palindromes in word " + word + " is " + count.to_s + "." 

puts "Palindromes: "
p palindromes
puts "Substrings: "
p substrings
