require 'minitest/autorun'
require 'minitest/pride'
require './solver'

class SolverTest < MiniTest::Test
	attr_reader :solver, :complete_row
	def setup
		@solver = Solver.new
		@complete_row = [1, 2, 3, 4, 5, 6, 7, 8, 9]
	end

	def test_it_exists
		assert Solver.new
	end

	def test_it_creates_rows_with_nine_elements
		result = solver.grid.all? {|row| row.size == 9 }
		assert result
	end

	def test_it_creates_nine_rows
		assert_equal 9, solver.grid.size
	end

	def test_grid_starts_with_all_zero_values
		result = solver.grid.map do |row|
			row.all? { |spot| spot == 0 }
		end
		final_result = result.all? { |e| e == true }
		assert final_result
	end

	def test_returns_false_if_non_zero_exists_in_grid
		solver.grid[0][0] = 1
		result = solver.grid.map do |row|
			row.all? { |spot| spot == 0 }
		end
		final_result = result.all? { |e| e == true }
		refute final_result
	end

	def test_spot_checker_returns_zero_for_spot_one_row_one_at_start
		assert_equal 0, solver.spot_checker(0, 0)
	end

	def test_spot_writer_assigns_correct_value_to_spot
		solver.spot_writer(0, 1, 3)
		assert_equal 3, solver.spot_checker(0, 1)
	end

	def test_spot_checker_returns_one_for_spot_set_to_one
		solver.spot_writer(0, 0, 1)
		assert_equal 1, solver.spot_checker(0, 0)
	end

	def test_row_with_no_duplicates_returns_true
		solver.spot_writer(0, 0, 1)
		assert solver.row_no_duplicates?(0)
	end

	def test_row_with_duplicates_returns_false
		solver.spot_writer(0, 0, 1)
		solver.spot_writer(0, 7, 1)
		refute solver.row_no_duplicates?(0)
	end

	def test_row_with_entire_range_is_complete
		solver.grid[0] = [1, 2, 3, 4, 6, 5, 7, 8, 9].shuffle
		assert solver.row_complete?(0)
  end

	def test_row_without_entire_range_is_not_complete
		solver.grid[3] = [1, 1, 1, 1, 1, 1, 1, 1, 1]
		refute solver.row_complete?(3)
	end

	def test_if_each_row_is_complete_game_is_over
    skip
		solver.grid.map do |row|
			row = complete_row
		end
		assert solver.puzzle_complete?
	end

  def test_makes_columns
   solver.grid.map! do |row|
    row = complete_row
   end
  assert_equal [2, 2, 2, 2, 2, 2, 2, 2, 2], solver.column_definer(1) 
  refute_equal [2, 2, 2, 2, 2, 2, 2, 2, 2], solver.column_definer(2)
  end

  def test_it_can_solve_puzzle_missing_one_spot
    
  end
end
