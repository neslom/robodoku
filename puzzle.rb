class Puzzle
  attr_accessor :board
  def initialize(file)
    @file = file
    @board =  File.open(@file).readlines.map do |line|
      line.delete("\n").chars.map(&:to_i)
    end
  end
end

b = Puzzle.new("puzzle0.txt")
#p b.splits_characters


