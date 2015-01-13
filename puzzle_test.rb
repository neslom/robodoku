require 'minitest/autorun'
require 'minitest/pride'
require './puzzle'

class PuzzleTest < MiniTest::Test
  attr_reader :puzzle
  def setup
    @puzzle = Puzzle.new("puzzle0.txt")
    @puzzle.board_generator 
    @puzzle.row_generator
  end

  def test_it_exists
    assert puzzle
  end

  def test_puts_incoming_board_into_array
    assert_equal [83921657], puzzle.board_generator[0]
  end

  def test_each_array_is_treated_as_a_row
    assert_equal [83921657], puzzle.rows[0]
  end
end
