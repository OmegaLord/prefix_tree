# frozen_string_literal: true

# class Node
class Node
  attr_reader :character, :child_arr
  attr_accessor :completed_word

  def initialize(character)
    @character = character
    @completed_word = false
    @child_arr = []
  end
end
