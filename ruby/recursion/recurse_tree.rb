#!/Users/bcabalo/.rvm/rubies/ruby-1.9.3-p194/bin/ruby

mgr_hash = {:a=>[:b], :b=>[:c, :d], :c=>[], :d=>[]}
space_hash = {:a=>10, :b=>2, :c=>15, :d=>1}

def calc_mgr_space(mgr, mgr_hash, space_hash)

  space = 0
  
  mgr_hash[mgr].each do |emp|
    space = space + calc_mgr_space(emp, mgr_hash, space_hash) 
  end
   
  return space + space_hash[mgr]
end

puts calc_mgr_space(:a, mgr_hash, space_hash)
