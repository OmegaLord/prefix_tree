# frozen_string_literal: true

require './prefix_tree_spec'

# class Tree
class Tree
  def initialize
    @root = Node.new('')
  end

  def add(text)
    words = text.join.split(Regexp.union([/[[:punct:]]/, /[[:blank:]]/]))
    words.each do |word|
      root = @root
      word.chars.each { |ch| root = add_char(ch, root.next) }
      root.complete = true
    end
    return 'Data save successful' unless @root.next.nil?

    'Error! Data not save.'
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
