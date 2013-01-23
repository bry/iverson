#!/Users/bcabalo/.rvm/rubies/ruby-1.9.3-p194/bin/ruby

numbers = [1,2,3,4]

def std_dev(numbers)
  std_dev = 0
  sum = 0
  mean = 0
  count = numbers.count

  numbers.each do |x|
    sum = sum + x    
  end

  puts "Count: #{count}"
  mean = sum.to_f / count.to_f
  puts "Mean: #{mean}"

  sum_squares = 0
  numbers.each do |x|
    sum_squares = sum_squares + ((x - mean) ** 2)
  end

  mean_sum_squares = sum_squares / count

  std_dev = Math.sqrt(mean_sum_squares)
  puts "Standard Deviation: #{std_dev}"

  return std_dev
end

puts std_dev(numbers)
