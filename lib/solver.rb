require 'pry'
class Solver
  attr_accessor :grid
  def initialize
    @grid = [
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0]
    ]
  end

  def spot_writer(row_number, spot_number, assignment=0)
    grid[row_number][spot_number] = assignment
  end

  def spot_checker(row_number, spot_number)
    grid[row_number][spot_number]
  end

  def row_no_duplicates?(row_number)
    ignored_zeros = grid[row_number].reject do |spot|
      spot == 0
    end
    if ignored_zeros.length == ignored_zeros.uniq.length
      true
    else
      false
    end
  end

  def row_complete?(row_number)
    if row_no_duplicates?(row_number) && !grid[row_number].include?(0) && one_thru_nine_present?(row_number)
      true
    else
      false
    end
  end

  def one_thru_nine_present?(row_number) # indirectly tested
    ([1, 2, 3, 4, 5, 6, 7, 8, 9] - grid[row_number]).empty?
  end

  def column_definer(column_number)
    grid.map do |row|
      row[column_number]  
    end
  end
end
