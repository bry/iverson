#!/usr/bin/ruby

def check_ints(int1,int2)
  raise "int1 must be an Integer" unless int1.kind_of? Integer
  raise "int2 must be an Integer" unless int2.kind_of? Integer
end


number = 0
string = ""

check_ints(number,string)

# Notes:
# Ruby dynamically typed
# Ruby Duck Typing
# .kind_of?
# .respond_to?
