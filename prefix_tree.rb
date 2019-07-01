# frozen_string_literal: true

require './node'

# class Tree realizes prefix tree struture
class Tree
  # reference for root node
  attr_reader :root

  def initialize
    @root = Node.new('')
  end

  # function add append words into tree
  def add(text)
    words = text.split(Regexp.union([/[[:punct:]]/, /[[:blank:]]/]))
    words.each do |word|
      node = @root
      word.chars.each do |c|
        node = find_or_create_node(c, node)
        return false if node.nil?
      end
      node.completed = true
    end
  end

  # function include? check word contain in tree
  def include?(word)
    node = @root
    letters = word.chars
    word_found = letters.all? do |letter|
      node = find_node(letter, node)
    end
    word_found && node.completed
  end

  private

  # function add_char finds node with char or call function new_node
  def find_or_create_node(char, node)
    find_node(char, node) || new_node(char, node)
  end

  # function new_node create new node theen add it into tree
  def new_node(char, node)
    Node.new(char).tap do |new_node|
      node.child_nodes << new_node
    end
  end

  # function find_char search char in node
  def find_node(char, node)
    node.child_nodes.find { |n| n.character == char }
  end
end
