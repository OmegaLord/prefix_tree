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
    node = @root
    words_arr = text.join.split(Regexp.union([/[[:punct:]]/, /[[:blank:]]/]))
    words_arr.each do |word|
      word.chars.each do |c|
        node = add_char(c, node)
        return false if node.nil?
      end
      node.completed_word = true
    end
    true
  end
  
  # function include? check word contain in tree
  def include?(word)
    node = @root
    letter_arr = word.chars
    word_found = letter_arr.all? do |letter|
      node = find_char(letter, node.child_arr)
    end
    word_found && node.completed_word
  end

  private

  # function add_char finds node with char or call function new_node
  def add_char(char, node)
    node.child_arr.find { |n| n.character == char } || new_node(char, node)
  end

  # function new_node create new node theen add it into tree
  def new_node(char, node)
    Node.new(char).tap do |new_node|
      node.child_arr << new_node
    end
  end

  # function find_char search char in node
  def find_char(char, node)
    node.find { |n| n.character == char }
  end
end
