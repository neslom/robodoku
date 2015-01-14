require './puzzle'

class Solver
  attr_reader :puzzle
  def initialize
    @puzzle = Puzzle.new("puzzle0.txt")
    @complete_range = (1..9).to_a
  end

  def puzzle_string 
    puzzle.board
  end

  def solve_one_spot_missing
    return_row.map do |line|
      missing_number = @complete_range - line
      line.map! do |spot|
        if spot == 0
          spot = missing_number[0]
        else
          spot
        end
      end
    end
  end

  def group_by_number
    puzzle_string.chars.group_by { |each| each }
  end
end

 #hash.keys.sort.map do |key|
   #p "#{key} -> #{hash[key].count}"
 #end
