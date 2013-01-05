class Node
  attr_accessor :value, :left, :right

  def initialize(value,left=nil,right=nil)
    @value,@left,@right = value,left,right 
  end

  def hasleft?
    if @left != nil
      true
    else
      false
    end
  end

  def hasright?
    if @right != nil
      true
    else
      false
    end
  end
end

class Tree
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  # Depth first traversal
  def traverseInOrder
     # Clear array
     @@orderedNodes = [] 
     traverseInOrderRecurse(root)
     @@orderedNodes
  end

  def traversePreOrder
     # Clear array
     @@orderedNodes = [] 
     traversePreOrderRecurse(root)
     @@orderedNodes
  end

  def traversePostOrder
     # Clear array
     @@orderedNodes = [] 
     traversePostOrderRecurse(root)
     @@orderedNodes
  end

  # Recursion traversal functions 
  private
  
  def traverseInOrderRecurse(root)
    if root == nil
      return
    else
      traverseInOrderRecurse(root.left)
      # Add to static array
      @@orderedNodes << root 
      traverseInOrderRecurse(root.right)
    end
  end
  
  def traversePreOrderRecurse(root)
    if root == nil
      return
    else
      @@orderedNodes << root 
      traversePreOrderRecurse(root.left)
      traversePreOrderRecurse(root.right)
    end
  end

  def traversePostOrderRecurse(root)
    if root == nil
      return
    else
      traversePostOrderRecurse(root.left)
      traversePostOrderRecurse(root.right)
      @@orderedNodes << root 
    end
  end
end
