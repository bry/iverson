require './tree'
require './node'

# Construct node tree
root = Node.new(100,nil,nil)
left = Node.new(50,nil,nil)
root.left = left
right  = Node.new(110, nil, nil)
root.right = right
leftchild = Node.new(10, nil, nil)
rightchild = Node.new(75, nil, nil)
left.left = leftchild
left.right = rightchild

tree = Tree.new(root)

# Output tree traversal orders
values = []

tree.traversePreOrder.each do |node|
   values << node.value
end

puts "PreOrder: "
p values
values.clear

tree.traverseInOrder.each do |node|
   values << node.value
end

puts "InOrder: "
p values
values.clear

tree.traversePostOrder.each do |node|
   values << node.value
end

puts "PostOrder: "
p values
values.clear
