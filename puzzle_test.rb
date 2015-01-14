require 'minitest/autorun'
require 'minitest/pride'
require './puzzle'

class PuzzleTest < MiniTest::Test
  attr_reader :puzzle
  def setup
    @puzzle = Puzzle.new("puzzle_one_missing.txt")
  end

  def test_it_exists
    assert puzzle
  end

  def test_puzzle_size_is_correct
    assert_equal 81, puzzle.board.length
    refute_equal 80, puzzle.board.length
  end

  def test_it_makes_a_row
    puzzle.row_maker
    assert_equal [" ", "8", "3", "9", "2", "1", "6", "5", "7"], puzzle.row[0]
  end

  def test_it_makes_a_column
    assert_equal [" ", "9", "2", "5", "7", "1", "3", "8", "6"], puzzle.column[0]
  end
end
