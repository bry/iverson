#!/usr/bin/ruby

# Fibonacci sequence: f(n) = f(n-1) + f(n-2) 
#                     where f(0)=0 and f(1)=1
def fibonacci(n)
  return 0 if n == 0 
  return 1 if n == 1
  fibonacci(n-1) + fibonacci(n-2)
end


puts fibonacci(1)
puts fibonacci(2)
puts fibonacci(3)
puts fibonacci(4)
puts fibonacci(5)
puts fibonacci(10)
