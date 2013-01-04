#!/usr/bin/ruby

# Fibonacci sequence: f(n) = f(n-1) + f(n-2)

def fibonacci(n)

  # Base cases
  if n == 0 
    0
  elsif n == 1
    1
  # Recursive case
  else
    return fibonacci(n-1) + fibonacci(n-2)
  end

end

puts fibonacci(1)
puts fibonacci(2)
puts fibonacci(3)
puts fibonacci(4)
puts fibonacci(5)
puts fibonacci(10)
