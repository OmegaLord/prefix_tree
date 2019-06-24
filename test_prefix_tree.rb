# frozen_string_literal: true

require 'minitest'
require 'minitest/autorun'
require './prefix_tree'

# Class TestPrefixTree
class TestPrefixTree < Minitest::Test
  def setup
    @val = 1
  end

  def test_phase
    assert_equal func, @val
  end
end
