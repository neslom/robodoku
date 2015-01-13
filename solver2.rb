require './puzzle'

class Solver
  attr_reader :puzzle
  def initialize
    @puzzle = Puzzle.new("puzzle0.txt")
    @complete_range = (1..9).to_a
  end
  #def assigns_spot_to_empty_space
  #@puzzle.board.map.with_index do |line, rowindex|
  #line.each_with_index do |spot, index|
  #if spot == 0
  #line[index] = Spot.new(rowindex, index)
  #end
  #end
  #end
  #end
  # if find a zero and row has multiple zeros, then must compare to
  # the column
  def return_row
    puzzle.board
  end

  #def missing_spot_count
    #return.row
  #end

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
end

class Spot
  def initialize(rowindex, spotindex)
    @rowindex = rowindex
    @spotindex = spotindex
  end
end

s = Solver.new
p s.return_row
