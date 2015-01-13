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

  def test_creates_spot_instance_on_empty_spot
    skip
    solver.assigns_spot_to_empty_space 
    assert_equal Spot, solver.puzzle.board[0][0].class
  end

  def test_replaces_one_empty_spot_correctly
    solver.solve_one_spot_missing
    assert_equal [4, 8, 3, 9, 2, 1, 6, 5, 7], solver.return_row[0]
  end

  def test_counts_missing_spots
    assert_equal 1, return_row.missing_spot_count
  end
end
