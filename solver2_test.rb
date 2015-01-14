require 'minitest/autorun'
require 'minitest/pride'
require './solver2'

class SolverTest < MiniTest::Test
  attr_reader :puzzle, :solver
  def setup
    @solver = Solver.new
  end

  def test_it_exists
    assert solver 
  end

  def test_it_identifies_missing_number
    solver.puzzle = Puzzle.new("puzzle_missing_each_row.txt")
    assert_equal ["4"], solver.find_missing_numbers[0]
    assert_equal [["4"], ["4"], ["4"], ["4"], ["4"], ["4"], ["4"], ["4"], ["4"]], solver.find_missing_numbers
  end

  def test_replaces_one_missing_element_on_row
    solver.puzzle = Puzzle.new("puzzle_missing_each_row.txt")
    assert_equal ["4", "8", "3", "9", "2", "1", "6", "5", "7"], solver.replaces_one_missing_number[0]
  end
end
