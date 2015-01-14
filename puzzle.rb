class Puzzle
  attr_accessor :board, :row
  def initialize(file)
    @file = file
    @board = File.open(@file).readlines.map do |line|
      line.delete("\n")
    end.join
    @row = []
  end

  def row_maker
    board.chars.each_slice(9) { |char| @row << char }
  end

  def column_maker
    
  end
end

#b = Puzzle.new("puzzle0.txt")
#p b.board



