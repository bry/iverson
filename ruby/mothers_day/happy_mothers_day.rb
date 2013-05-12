#!/usr/bin/ruby

def happy(switch, &block)
  print "<3 I love you " if yield == "day!"
  puts "mom! <3" if switch == :mothers
end

happy(:mothers) { "day!" }
