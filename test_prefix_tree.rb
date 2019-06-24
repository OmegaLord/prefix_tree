# frozen_string_literal: true

require 'minitest'
require 'minitest/autorun'
require './prefix_tree'

# Class TestPrefixTree
class TestPrefixTree < Minitest::Test
  def setup; end

  def test_new_tree
    assert Tree.new
  end
end
