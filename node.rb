# frozen_string_literal: true

# class Node
class Node
  attr_reader :character, :child_nodes
  attr_accessor :completed

  def initialize(character = '')
    @character = character
    @completed = false
    @child_nodes = []
  end
end
