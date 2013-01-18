#!/Users/bcabalo/.rvm/rubies/ruby-1.9.3-p194/bin/ruby

require 'json'

data = {:hello => "world", :numbers => [1,2,5,0]}

json_format = JSON.generate(data)

puts json_format.methods.to_s
puts json_format.to_s
puts json_format.to_json

