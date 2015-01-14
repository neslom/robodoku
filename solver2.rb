require 'pry'
require './puzzle'

class Solver
  attr_accessor :puzzle
  def initialize
    @puzzle = Puzzle.new
    @complete_range = (1..9).to_a.map { |i| i.to_s }
  end

  def puzzle_rows 
    puzzle.row
  end

  def find_missing_numbers
    # this returns array of 9 arrays containing the missing elements for the row
    puzzle_rows.map do |row|
      @complete_range - row
    end
  end

  def replaces_one_missing_number
   puzzle_rows.map.with_index do |row, index|
      row.map { |spot| spot == " " ? spot = find_missing_numbers[index][0] : spot }
    end
  end

  def group_by_number
    puzzle_string.chars.group_by { |each| each }
  end
end
