#!/usr/bin/ruby

# Given array:
array = [1,2,0,4,0,0,8,3,2,1,4,6,0,0,0,3,0]
# Push all zeros in the array to end of the array

puts "Input: "
p array

length = array.length - 1

indicies_to_delete = []

for i in 0..length
  if array[i] == 0
    indicies_to_delete << i
  end
end

indicies_to_delete.reverse!

length = indicies_to_delete.length - 1

for i in 0..length
  array.delete_at(indicies_to_delete[i])
end

for i in 0..length
  array << 0
end

puts "Output: "
p array
