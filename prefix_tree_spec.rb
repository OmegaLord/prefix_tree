# frozen_string_literal: true

# class Node
class Node
  attr_reader :character, :elements
  attr_accessor :complete

  def initialize(character)
    @character = character
    @complete = false
    @elements = []
  end
end
