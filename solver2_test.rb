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

  def test_puzzle_size_is_correct
    assert_equal 81, solver.puzzle_string.length
    refute_equal 80, solver.puzzle_string.length
  end
end
