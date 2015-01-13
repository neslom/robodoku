require 'minitest/autorun'
require 'minitest/pride'
require './puzzle'

class PuzzleTest < MiniTest::Test
  attr_reader :puzzle
  def setup
    @puzzle = Puzzle.new("puzzle0.txt")
  end

  def test_it_exists
    assert puzzle
  end

  def test_puts_incoming_board_into_array
    assert_equal [0, 8, 3, 9, 2, 1, 6, 5, 7], puzzle.board[0]
    assert_equal [6, 9, 5, 4, 1, 7, 3, 8, 2], puzzle.board[8]
  end
end
