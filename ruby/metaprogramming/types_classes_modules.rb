#!/Users/bcabalo/.rvm/rubies/ruby-1.9.3-p392/bin/ruby

# 8.1
str = "abc"
puts str.class
puts str.class.superclass # 8.1 pg. 266 errata
puts str.instance_of? String
puts str.is_a? String
puts str.kind_of? String
puts String === str 
puts str.respond_to?"to_s"
