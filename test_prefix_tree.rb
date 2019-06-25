# frozen_string_literal: true

require 'minitest'
require 'minitest/autorun'
require './prefix_tree'

# Class TestPrefixTree
class TestPrefixTree < Minitest::Test
  def setup
    @tree = Tree.new
    @str = 'Lorem'
  end

  def test_new_tree
    assert Tree.new
  end

  def test_add_function
    assert @tree.add(@str.split)
    pointer_node = @tree.root.elements
    @str.each_char do |c|
      pointer_node = try_find_node_with_char(pointer_node, c)
      assert_equal c, pointer_node.character
      pointer_node = get_deep_node(pointer_node)
    end
  end

  def get_deep_node(node)
    node.elements
  end

  def try_find_node_with_char(node, char)
    node.find { |n| n.character == char }
  end
end
