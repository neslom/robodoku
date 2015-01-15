require 'pry'
require './lib/puzzle'

class Solver
  attr_accessor :puzzle
  def initialize
    @puzzle = Puzzle.new
  end

  def complete_range
    (1..9).to_a.map { |i| i.to_s }
  end

  def puzzle_rows 
    puzzle.row
  end

  def puzzle_columns
    puzzle.column
  end

  def find_missing_columns_row
    puzzle_columns.map do |column|
      complete_range - column 
    end
  end

  def find_missing_numbers_row
    puzzle_rows.map do |row|
      complete_range - row
    end
  end

  def no_multiples_on_row? 
    find_missing_numbers_row.all? { |e| e.size <= 1 } 
  end

  def replaces_one_missing_number
    if no_multiples_on_row? 
      puzzle_rows.map!.with_index do |row, index|
        row.map { |spot| spot == " " ? spot = find_missing_numbers_row[index][0] : spot }
      end
    else
      puzzle_columns.map!.with_index do |column, index|
        column.map { |spot| spot == " " ? spot = find_missing_columns_row[index][0] : spot }
      end
    end
  end
end

#solver = Solver.new
#p solver.puzzle.board
#solver.replaces_one_missing_number
#p solver.puzzle.row.map { |x| x.join }.join
