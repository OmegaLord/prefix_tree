# frozen_string_literal: true

require 'minitest'
require 'minitest/autorun'
require './prefix_tree'

# Class TestPrefixTree tests function of class Tree
class TestPrefixTree < Minitest::Test
  def setup
    @tree = Tree.new
    @str = 'Lorem'
    @tree.add(@str.split)
  end

  # test_new_tree for test creation new class Tree object
  def test_new_tree
    assert Tree.new
  end

  # test_add_function for check add words
  def test_add_function
    find_each_char_in_tree(@str, @tree)
  end

  # test_list_function to check tree word list 
  def test_list_function
    @tree.list.each { |word| assert_equal @str, word }
  end

  # function find_each_char_in_tree search each string char in tree
  def find_each_char_in_tree(string, tree)
    pointer_node = tree.root.child_arr
    string.each_char do |c|
    assert @tree.add(@str.split)
    pointer_node = @tree.root.child_arr
    @str.each_char do |c|
      pointer_node = try_find_node_with_char(pointer_node, c)
      assert_equal c, pointer_node.character
      pointer_node = get_deep_node(pointer_node)
    end
  end
end

  # function get_deep_node gets node which are located deer in tree
  def get_deep_node(node)
    node.child_arr
  end

  # function try_find_node_with_char found char in node
  def try_find_node_with_char(node, char)
    node.find { |n| n.character == char }
  end
end
