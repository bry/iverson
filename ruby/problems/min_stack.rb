#!/usr/bin/ruby

# Problem: Find the minimum number in a stack
# Solution: Use a minstack and track min

class MinStack
  def initialize
    @currentMin = 10000000 
    @stack = []
    @minStack = []
  end

  def push(value)
    @stack.push(value)
    if value < @currentMin
      @currentMin = value
      @minStack.push(value) 
    else
      @minStack.push(@currentMin)
    end 
  end

  def pop
    min = @minStack.pop
    @currentMin = @minStack.pop
    @minStack.push(@currentMin)
    @stack.pop
  end

  def getMin
    min = @minStack.pop
    @minStack.push(min)
    min
  end
end


ms = MinStack.new
ms.push(3)
ms.push(2)
ms.push(1)
ms.push(14)

puts ms.getMin.to_s
ms.pop
ms.pop
ms.pop
puts ms.getMin.to_s
