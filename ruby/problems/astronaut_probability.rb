#!/Users/bcabalo/.rvm/rubies/ruby-1.9.3-p194/bin/ruby

# Determining astronautness through real world probabilities
require 'benchmark'

class Person
  ASTRONAUT_DENOMINATOR = 13200000

  # Odds of being an astronaut: 13,200,000 to 1 
  def an_astronaut?
    random = Random.new
    #number = random.rand(1..2) 
    number = random.rand(1..ASTRONAUT_DENOMINATOR)

    if number == 1 
      true
    else
      false 
    end
  end
end


buzz_aldrin = Person.new
puts "Is Buzz Aldrin an astronaut? " 
puts "Computer is calculating probability..."
duration_in_seconds = Benchmark.realtime { buzz_aldrin.an_astronaut? ? (puts "Yes") : (puts "No") }
processor_name = `system_profiler SPHardwareDataType | grep "Processor Name" | cut -d ":" -f2`
puts "This took " + duration_in_seconds.to_s + " seconds to calculate running on an " + processor_name.strip + " processor."
