#!/Users/bcabalo/.rvm/rubies/ruby-2.0.0-preview1/bin/ruby

puts "Ruby 2"

# Refinements (localized monkey patching)
module MyStringRefinement
  refine String do 
    def number?
      match(/\d+/) ? true : false
    end
  end
end

begin
  "22".number? #=> #<NoMethodError: undefined method `number?' for "22":String>
rescue => e
  p e #=>
end


module MyStringRefinement
  p "22".number? # => true
end


module MyApp
  using MyStringRefinement

  p "123".number? # => true
  p "foo".number? # => false
end


# %i literal for symbol array
p %i{hello world whoop there it is}


# Keyword arguments
def word_wrap(string, before: "<", after: ">")
  "#{before}#{string}#{after}"
end

p word_wrap("tag")
p word_wrap("tag",before: "#<")
p word_wrap("tag", after: "]")
p word_wrap("tag", after: "]", before: "[")

def capture_params(**params)
  params
end

p capture_params(foo:"bar", hello:"world")
p capture_params(hello:"world", foo:"bar")


