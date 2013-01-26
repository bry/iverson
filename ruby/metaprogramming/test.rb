class Test

  puts "In definition of class Test"
  puts "self = #{self}"
  puts "Class of self = #{self.class}"

  def one 
    @var = 99
    two
  end

  def two
    puts @var
  end
end

t = Test.new
t.one
