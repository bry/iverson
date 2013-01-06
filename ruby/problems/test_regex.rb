#!/usr/bin/ruby

word = "teststringab"
#pattern = "*"
#pattern = "a*b"
#pattern = "ab"
pattern = "[a-z]@{1}gmail.com"
email = "b1cabalo@gmail.com"

if pattern != "*"
  if word=~/#{pattern}/i
    puts "TRUE"
  else
    puts "FALSE"
  end
end

if email=~/#{pattern}/i
  puts "Email matches"
else
  puts "Email doesn't match"
end

