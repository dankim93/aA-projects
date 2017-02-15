class BSTNode
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(value)
    if !@root
      @root = BSTNode.new(value)
      return
    end

    BinarySearchTree.insert!(@root, value)
  end

  def find(value)
    BinarySearchTree.find!(@root, value)
  end

  def inorder
    BinarySearchTree.inorder!(@root)
  end

  def postorder
    BinarySearchTree.postorder!(@root)
  end

  def preorder
    BinarySearchTree.preorder!(@root)
  end

  def height
    BinarySearchTree.height!(@root)
  end

  def min
    BinarySearchTree.min(@root)
  end

  def max
    BinarySearchTree.max(@root)
  end

  def delete(value)
    @root = BinarySearchTree.delete!(@root, value)
  end

  def self.insert!(node, value)
    return BSTNode.new(value) if !node

    if value <= node.value
      node.left = BinarySearchTree.insert!(node.left, value)
    else
      node.right = BinarySearchTree.insert!(node.right, value)
    end

    node
  end

  def self.find!(node, value)
    return nil if !node
    return node if node.value == value

    if value < node.value
      return BinarySearchTree.find!(node.left, value)
    end

    BinarySearchTree.find!(node.right, value)
  end

  def self.preorder!(node)
    return [] if !node

    answer = [node.value]
    answer += BinarySearchTree.preorder!(node.left) if node.left
    answer += BinarySearchTree.preorder!(node.right) if node.right

    answer
  end

  def self.inorder!(node)
    return [] if !node

    answer = []
    answer += BinarySearchTree.inorder!(node.left) if node.left
    answer << node.value
    answer += BinarySearchTree.inorder!(node.right) if node.right

    answer
  end

  def self.postorder!(node)
    return [] if !node

    answer = []
    answer += BinarySearchTree.postorder!(node.left) if node.left
    answer += BinarySearchTree.postorder!(node.right) if node.right
    answer << node.value

    answer
  end

  def self.height!(node)
    return -1 if !node

    1 + [BinarySearchTree.height!(node.left), BinarySearchTree.height!(node.right)].max
  end

  def self.max(node)
    return nil if !node
    return node if !node.right

    BinarySearchTree.max(node.right)
  end

  def self.min(node)
    return nil if !node
    return node if !node.left

    BinarySearchTree.min(node.left)
  end

  def self.delete_min!(node)
    return nil if !node
    return node.right if !node.left

    node.left = BinarySearchTree.delete_min!(node.left)
    node
  end

  def self.delete!(node, value)
    return nil if !node

    if value < node.value
      node.left = BinarySearchTree.delete!(node.left, value)
    elsif value == node.value
      return node.left if !node.right
      return node.right if !node.left
      temp = node
      node = temp.right.min
      node.right = BinarySearchTree.delete_min!(temp.right)
      node.left = temp.left
    else
      node.right = BinarySearchTree.delete!(node.right, value)
    end

    node
  end
end
