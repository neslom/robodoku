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


end
