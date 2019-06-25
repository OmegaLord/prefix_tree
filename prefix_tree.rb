# frozen_string_literal: true

require './prefix_tree_spec'

# class Tree
class Tree
  attr_reader :root
  def initialize
    @root = Node.new('')
  end

  def add(text)
    node = @root
    words = text.join.split(Regexp.union([/[[:punct:]]/, /[[:blank:]]/]))
    words.each do |word|
      word.chars.each do |c|
        node = add_char(c, node)
        return false if node.nil?
      end
      node.complete = true
    end
    true
  end

  private

  def add_char(char, node)
    node.elements.find { |n| n.character == char } || new_node(char, node)
  end

  def new_node(char, node)
    Node.new(char).tap do |new_node|
      node.elements << new_node
    end
  end
end
