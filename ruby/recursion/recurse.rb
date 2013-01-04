#!/usr/bin/ruby

# Fibionacci sequence: n! = n * (n-1)!

def fibionacci(n)

  # Recursive case
  if n > 1
    n * fibionacci(n-1)
  # Base case
  else
    1
  end

end


puts fibionacci(12)
