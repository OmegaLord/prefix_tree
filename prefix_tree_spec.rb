# frozen_string_literal: true

require 'minitest'
require 'minitest/autorun'
require './prefix_tree'

DIR = 'data'
FILE = 'words'

# Class TestPrefixTree tests function of class Tree
class TestPrefixTree < Minitest::Test
  def setup
    @tree = Tree.new
    @str = 'foo, bar. baz'
    @tree.add(@str)
  end

  # test_new_tree for test creation new class Tree object
  def test_new_tree
    assert Tree.new
  end

  # test_add_function for check add words
  def test_add_function
    find_each_char_in_tree(get_strings(@str), @tree)
  end

  # test_include_function for check include? method in Class Tree
  def test_include_function
    strings_block_assert(@str) { |param| @tree.include?(param) }
  end

  # test_list_function to check tree word list via check each word in
  #                                                    @list variable
  def test_list_function
    strings_block_assert(@str) { |param| @tree.list.include?(param) }
  end

  # test_save_to_file to check function and creation file
  def test_save_to_file
    assert @tree.save_to_file
    assert Dir.exist?(DIR)
    assert File.exist?("#{DIR}/#{FILE}")
    check_file_for_tree_words("#{DIR}/#{FILE}", @tree)
  end

  # test_save_to_file to check function and load from file information
  def test_load_from_file
    assert Dir.exist?(DIR)
    assert File.exist?("#{DIR}/#{FILE}")
    assert @tree.load_from_file
    check_file_for_tree_words("#{DIR}/#{FILE}", @tree)
    File.delete("#{DIR}/#{FILE}")
    Dir.delete(DIR)
  end

  # function find_each_char_in_tree search each string char in tree
  def find_each_char_in_tree(strings, tree)
    pointer_node = tree.root.child_nodes
    strings.each do |s|
      pointer_node = @tree.root.child_nodes
      s.each_char do |c|
        pointer_node = try_find_node_with_char(pointer_node, c)
        assert_equal c, pointer_node.character
        pointer_node = get_deep_node(pointer_node)
      end
    end
  end

  # function get_deep_node gets node which are located deer in tree
  def get_deep_node(node)
    node.child_nodes unless node.child_nodes.nil?
  end

  # function try_find_node_with_char found char in node
  def try_find_node_with_char(node, char)
    node.find { |n| n.character == char }
  end

  def get_strings(string)
    string.split(Regexp.union([/[[:punct:]]/, /[[:blank:]]/]))
          .reject!(&:empty?)
  end

  def strings_block_assert(str)
    get_strings(str).each { |s| assert yield(s) }
  end

  def check_file_for_tree_words(path, tree)
    File.open(path) do |review_file|
      review_file.readlines.each(&:chomp!)
      find_each_char_in_tree(review_file.readlines.each(&:chomp!), tree)
    end
  end
end
