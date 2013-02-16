def calc_mgr_space(mgr, mgr_hash, space_hash)
  space = 0
  mgr_hash[mgr].each do |emp|
    space = space + calc_mgr_space(emp, mgr_hash, space_hash) 
  end

  return space + space_hash[mgr]
end
