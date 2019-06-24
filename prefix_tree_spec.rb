# frozen_string_literal: true

# class Node
class Node
  attr_reader :character, :next
  attr_accessor :complete

  def initialize(character)
    @character = character
    @complete = false
    @next = []
  end
end
