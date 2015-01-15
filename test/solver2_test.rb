require 'minitest/autorun'
require 'minitest/pride'
require './lib/solver2'

class SolverTest < MiniTest::Test
  attr_reader :puzzle, :solver, :solved
  def setup
    @solver = Solver.new
  end

  def test_it_exists
    assert solver 
  end

  def test_it_identifies_missing_number
    solver.puzzle = Puzzle.new("./test/support/puzzle_missing_each_row.txt")
    assert_equal ["4"], solver.find_missing_numbers_row[0]
    assert_equal [["4"], ["4"], ["4"], ["4"], ["4"], ["4"], ["4"], ["4"], ["4"]], solver.find_missing_numbers_row
  end

  def test_replaces_one_missing_element_on_row
    solver.puzzle = Puzzle.new("./test/support/puzzle_missing_each_row.txt")
    assert_equal ["4", "8", "3", "9", "2", "1", "6", "5", "7"], solver.replaces_one_missing_number[0]
  end

  def test_replaces_one_missing_element_on_each_row
    solver.puzzle = Puzzle.new("./test/support/puzzle_missing_each_row.txt")
    result = solver.puzzle = Puzzle.new("./test/support/puzzle_missing_each_row_solved.txt")
    assert_equal result.row, solver.replaces_one_missing_number
  end

  def test_returns_true_if_multiple_spots_missing_on_first_row
    solver.puzzle = Puzzle.new("./test/support/puzzle_missing_each_column.txt")
    refute solver.no_multiples_on_row?
  end

  def test_replaces_by_column_if_first_row_missing
    solver.puzzle = Puzzle.new("./test/support/puzzle_missing_each_column.txt")
    result = solver.puzzle = Puzzle.new("./test/support/puzzle_missing_each_column_solved.txt")
    assert_equal result.row , solver.replaces_one_missing_number  
  end

  def test_replaces_spots_with_missing_column_and_row
    solver.puzzle = Puzzle.new("./test/support/missing_column_and_row.txt")
    result = solver.puzzle = Puzzle.new("./test/support/puzzle_missing_each_column_solved.txt")
    assert_equal result.row, solver.replaces_one_missing_number
  end
end
