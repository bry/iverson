class Node
  include Comparable

  attr_accessor :children
  attr_accessor :letter

  def initialize(char=nil, child_nodes=[])
    @letter = char 
    @children = child_nodes
  end

  def ==(otherNode)
    @letter == otherNode.letter
  end

  def has_null_child?
    self.children.include?(Node.new("nil"))
  end

  def has_no_null_child?
    self.children.include?(Node.new("nil")).nil?
  end

  def has_child?(node)
    self.children.include?(node)
  end

  def get_child_index_of(node)
    self.children.index(node)
  end

  def fetch_child_by_index(node_index)
    self.children.fetch(node_index)
  end
end

class Trie
  attr_accessor :root

  def initialize(words=nil)
    @root = build_trie(words)
  end

  private

  def build_trie(words)
    root_node = Node.new("",[])
    prev_char_node = Node.new
    words.each do |word|
      word.chars.each_with_index do |char,index|
        char_node = Node.new(char)

        if index == 0 and !root_node.has_child?(char_node)
          root_node.children << char_node 
          prev_char_node = char_node
        elsif index == 0 and root_node.has_child?(char_node)
          node_index = root_node.children.index(char_node)
          prev_char_node = root_node.children.fetch(node_index) 
        elsif !prev_char_node.has_child?(char_node) 
          prev_char_node.children << char_node 
          prev_char_node = char_node
        elsif prev_char_node.has_child?(char_node) 
          node_index = prev_char_node.children.index(char_node)
          prev_char_node = prev_char_node.children.fetch(node_index) 
        end
      end

      # Mark word termination
      prev_char_node.children << Node.new("nil",[]) 

    end unless words == nil

    root_node
  end
end
