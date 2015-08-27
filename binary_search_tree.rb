require 'pry'
class BST
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end

  def orient(direction, data, current)
    current.send(direction).nil? ? current.send(direction + "=", BST.new(data)) : traverse_tree(data, current.send(direction))
  end

  def traverse_tree(data, current)
    direction = data <= current.data ? "left" : "right"
    orient(direction, data, current)
  end

  def insert(data)
    traverse_tree(data, self)
  end

  def in_order_traversal(node = self, &block)
    return if node.nil?
    in_order_traversal(node.left, &block)
    yield node.data
    in_order_traversal(node.right, &block)
  end

  def each(&block)
    in_order_traversal(&block)
  end
end

