require_relative 'polytreenode'
require 'byebug'

class KnightPathFinder
  def initialize(start_pos, visited_pos = [start_pos])
    @start_pos = start_pos
    @visited_pos = visited_pos
  end

  DELTAS = [ [-2,1], [-1,2], [1,2], [2,1], [2,-1], [1,-2], [-1,-2], [-2,-1]]

  def self.valid_moves(pos)
    # spots you havent visited that are in range
    squares = DELTAS.map { |x, y| [pos[0]+x, pos[1]+y] }
    squares.select { |x, y| x.between?(0,7) && y.between?(0,7) }
  end

  def new_move_positions(pos)
    moves = KnightPathFinder.valid_moves(pos).reject {|move| @visited_pos.include?(move)}
    moves.each {|move| @visited_pos << move}
    moves
  end

  def visited_pos
    @visited_pos
  end

  def build_move_tree
    @start_node = PolyTreeNode.new(@start_pos)
    queue = [@start_node]

    until queue.empty?
      current = queue.shift
      new_move_positions(current.value).each do |new_pos|
        next if new_move_positions(current.value).nil?
        new_node = PolyTreeNode.new(new_pos)
        queue << new_node
        current.add_child(new_node)
      end
    end
  end


  # def find_path(end_pos)
  #   queue = [@start_node]
  #
  #   until queue.empty?
  #     current = queue.shift
  #     @end_point = current if current.value == end_pos
  #     return @end_point if @end_point
  #
  #     current.children.each do |child|
  #       queue << child
  #     end
  #   end
  #
  #   nil
  # end

  def find_path(end_pos)
    @end_node = @start_node.bfs(end_pos)
  end

  def trace_path_back
    path = [@end_node.value]
    current = @end_node
    until current.parent.nil?
      current = @end_node.parent
      path.push(current.value)
    end
    # use parents til you get to root; use unshift
    #given end_pos; go back and then build path
    path
  end

end


a = KnightPathFinder.new ([0,0])
a.build_move_tree
a.find_path([2,4])
p a.trace_path_back
