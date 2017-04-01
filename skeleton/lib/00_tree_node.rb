require 'byebug'

class PolyTreeNode
  attr_reader :value
  def initialize(value, parent = nil)
    @value, @parent, @children = value, parent, []
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

  def parent=(node)
    @parent.children.delete(self) unless @parent.nil?
    @parent = node
    node.children << self unless node.nil? || node.children.include?(self)
  end

  def add_child(node)
    node.parent = self
  end

  def remove_child(node)
    raise "error" unless @children.include?(node)
    node.parent = nil
  end

  def dfs(target)
    return self if self.value == target

    @children.each do |node|
      ret = node.dfs(target)
      return ret unless ret.nil?
    end
    nil
  end

  def bfs(target)
    set = [self]

    while set.length >= 1
      val = set.shift
      return val if val.value == target
      val.children.each { |node| set << node}
    end
    nil
  end
end

# Write add_child(child_node) and remove_child(child_node) methods. These methods should be one- or two-liners that call #parent=.
#
# Phase 4: Searching
#
# Write a #dfs(target_value) method which takes a value to search for and performs the search. Write this recursively.
# First, check the value at this node. If a node's value matches the target value, return the node.
# If not, iterate through the #children and repeat.
# Write a #bfs(target_value) method to implement breadth first search.
# You will use a local Array variable as a queue to implement this.
# First, insert the current node (self) into the queue.
# Then, in a loop that runs until the array is empty:
# Remove the first node from the queue,
# Check its value,
# Push the node's children to the end of the array.
# Prove to yourself that this will check the nodes in the right order. Draw it out. Show this explanation to your TA.
# Get your TA to check your work!
# Make sure all the specs pass.
