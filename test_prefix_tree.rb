# frozen_string_literal: true

require 'minitest'
require 'minitest/autorun'
require './prefix_tree'

# Class TestPrefixTree
class TestPrefixTree < Minitest::Test
  def setup
    @tree = Tree.new
    @str = "Lorem ipsum dolor sit amet, consectetur adipiscing elit,
  	sed do eiusmod tempor incididunt ut
  	labore et dolore magna aliqua. Ut enim ad minim veniam,
  	quis nostrud exercitation ullamco laboris nisi ut aliquip "
  end

  def test_new_tree
    assert Tree.new
  end

  def test_add_function
    assert_equal 'Data save successful', @tree.add(@str.split)
  end
end
