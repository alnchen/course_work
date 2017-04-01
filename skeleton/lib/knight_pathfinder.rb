require_relative '00_tree_node.rb'
class Kpf

  attr_reader :start_position

  def initialize(position)
    @board = Array.new(8) { Array.new(8, nil)}
    @start_position = PolyTreeNode.new(position)
    self[position] = @start_position
    @directions = [2,1,-1,-2].permutation(2).to_a.reject {|arr| arr[0].abs == arr[1].abs}
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @board[row][col] = value
  end

  def display
    @board.each { |row| puts row.to_s }
  end

  def populate
    #while
  end

  def valid_move?

  end

  def find_moves(node)
    moves = []
    cur = node.value
    @directions.each do |dir|
      moves << [cur[0] + dir[0], cur[1] + dir[1]]
    end
    p moves
  end

end

#   Phase 0: Description
#
# In this problem we want to write a class that will find a path for a Chess Knight from a starting position to an end position. Both the starting and ending position should be on a standard 8x8 chess board.
#
# NB: this problem is a lot like word chains!
#
# Write a class, KnightPathFinder. Initialize your KnightPathFinder with a starting position. For instance
#
# kpf = KnightPathFinder.new([0, 0])
# Ultimately, I want to be able to find paths to end positions:
#
# kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
# kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]
# To help us find paths, we want to build a move tree. The values in the tree will be positions. A parent is connected to a child if you can move from the parent position to the child position. The root of the tree should be the knight's starting position. You will want to build on your PolyTreeNode work, using PolyTreeNode instances to represent each position.
#
# We'll write a method KnightPathFinder#build_move_tree to build the move tree and store it in an instance variable. We'll call this method in initialize; you'll use the move tree whenever we call find_path. Don't write this yet though.
