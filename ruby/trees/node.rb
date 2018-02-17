class Node
  attr_accessor :value, :left, :right

  def initialize(value, left=nil, right=nil)
    @value = value
    @left = left
    @right = right
  end

  def hasleft?
    left == nil ? false : true
  end

  def hasright?
    right == nil ? false : true
  end
end
