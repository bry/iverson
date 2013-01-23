# Using std dev formula from:
#http://mathworld.wolfram.com/images/equations/StandardDeviation/NumberedEquation2.gif
def std_dev(numbers)

  return 0.0 if numbers.count == 0

  std_dev = 0
  sum = 0
  mean = 0
  count = numbers.count

  numbers.each do |x|
    sum = sum + x    
  end

  mean = sum.to_f / count.to_f

  sum_squares = 0
  numbers.each do |x|
    sum_squares = sum_squares + ((x - mean) ** 2)
  end

  mean_sum_squares = sum_squares / count

  std_dev = Math.sqrt(mean_sum_squares)
end
