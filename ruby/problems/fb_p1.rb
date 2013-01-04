#!/usr/bin/ruby

# Problem: Given 6 columns of numbers, if the 6th column
# is greater than 200 threshold 5 times in a row
# report an error 
line = "123 234 324323 34325 2343 234324"
line2 = "123 234 324323 34325 2343 199"
@@count = 0

def inputCallback(line,count)

  columns = line.split(" ")

  if columns[5].to_i > 200
    @@count = @@count + 1
  else
    @@count = 0 
  end

  if @@count == 5
    puts "ERROR!"
  end

end

inputCallback(line,$count)
inputCallback(line,$count)
inputCallback(line,$count)
inputCallback(line,$count)
inputCallback(line2,$count)
inputCallback(line,$count)
inputCallback(line,$count)
inputCallback(line,$count)
inputCallback(line,$count)
inputCallback(line2,$count)
inputCallback(line,$count)
inputCallback(line,$count)
inputCallback(line,$count)
inputCallback(line,$count)
inputCallback(line,$count)
inputCallback(line,$count)
inputCallback(line,$count)
inputCallback(line,$count)
