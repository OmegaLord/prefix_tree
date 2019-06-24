# frozen_string_literal: true

require './prefix_tree_spec'

# class Tree
class Tree
  def initialize
    @root = Node.new('')
  end

  def add(text)
    text = text.join
    exp = Regexp.union [/[[:punct:]]/, /[[:blank:]]/]
    words = text.split exp
    words.each do |word|
      root = @root
      word.chars.each { |ch| root = add_char(ch, root.next) }
      root.complete = true
    end
  end

  private

  def add_char(symbol, root)
    root.find { |n| n.character == symbol } || new_node(symbol, root)
  end

  def new_node(symbol, root)
    Node.new(symbol).tap do |new_node|
      root << new_node
    end
  end
end
