#!/usr/bin/ruby

puts "What is your name?"
name = gets

puts "Hi " + name
name.chomp!

puts "Name a person"
person = gets
person.chomp!

puts "What is your favorite color?"
color = gets
color.chomp!

puts "What is your favorite car?"
car = gets
car.chomp!

puts "Name your favorite ice cream flavor?"
flavor = gets
flavor.chomp!

puts "What is your favorite animal?"
animal = gets
animal.chomp!

puts
puts "Here is your San Francisco MadLib: "
puts
puts name + " bought " + color + " flowers for " + person + "."
puts name + " drove his " + car + " to San Francisco while eating " + flavor + " ice cream."
puts "Then a " + animal + " licked his icecream."
puts "The End!"
puts

#a = "Hello World"
#intheword = "in the word " + a

#puts "There are " + a.size.to_s + " letters " + intheword

#puts "There are " + a.bytesize.to_s + " bytes " + intheword

#puts "Hash: " + a.hash.to_s

#==END
