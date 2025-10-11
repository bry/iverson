# frozen_string_literal: true

def fib(n)
  return n if n < 2
  fib(n - 1) + fib(n - 2)
end

puts "Calculating Fibonacci numbers: Single Process (Single Core)"
n = 40
start = Time.now
(1..n).each do |num|
   fib(num)
end
puts "(Time: #{Time.now - start}s)"


puts "Calculating Fibonacci numbers with Threads (Single Core)"
n = 40
start = Time.now
threads = (1..n).map do |num|
  Thread.new(num) do |num|
    fib(num)
  end
end
threads.each(&:join)
puts "(Time: #{Time.now - start}s)"


puts "Calculating Fibonacci numbers with OS Processes (Multicore Utilization)"
n = 40
start = Time.now
processes = (1..n).map do |num|
  Process.fork do
    fib(num)
  end
end
processes.each do |pid|
  Process.waitpid(pid)
end
puts "(Time: #{Time.now - start}s)"


puts "Calculating Fibonacci numbers with Ruby 3.5 Ractors (Multicore Utilization)"
n = 40
start = Time.now
ractors = (1..n).map do |num|
  Ractor.new(num) do |num|
    fib(num)
  end
end
ractors.each(&:take)
puts "(Time: #{Time.now - start}s)"
