class Tree
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def traverseInOrder
     @@orderedNodes = []
     traverseInOrderRecurse(root)
     @@orderedNodes
  end

  def traversePreOrder
     @@orderedNodes = []
     traversePreOrderRecurse(root)
     @@orderedNodes
  end

  def traversePostOrder
     @@orderedNodes = []
     traversePostOrderRecurse(root)
     @@orderedNodes
  end

  private

  def traverseInOrderRecurse(root)
    if root == nil
      return
    else
      traverseInOrderRecurse(root.left)
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
