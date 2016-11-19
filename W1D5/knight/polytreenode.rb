class PolyTreeNode
  def initialize(value, parent=nil, children=[])
    @value = value
    @parent = parent
    @children = children
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(parent_node)
    @parent.children.delete(self) if parent
    @parent = parent_node
    parent_node.children << self unless parent_node.nil?
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise_error if !self.children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target_value) #recursion
    return self if self.value == target_value

    self.children.each do |child|
      current = child.dfs(target_value)
      return current if current
    end

    nil
  end

  def bfs(target_value)
    queue = [self]

    until queue.empty?
      current = queue.shift
      return current if current.value == target_value

      current.children.each do |child|
        queue << child
      end
    end

    nil
  end

end
