class Puzzle
  attr_reader :board, :rows
  def initialize(file)
    @file = file
    @board = []
    @rows = {}
  end

  def board_generator
    @board = File.open(@file).readlines.map do |line|
      [line.strip.to_i]
    end
  end
  # each incoming line is integers in an array
  # need to set the empty slots to nil or zero so I can recognize the 
  # ones that need to be assessed for assignment
  def row_generator
    @board.each_with_index do |row, index|
      @rows[index] = row
    end
  end 
end

b = Puzzle.new("puzzle0.txt")

b.board_generator
b.row_generator
p b.rows[0]
