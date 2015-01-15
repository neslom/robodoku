require 'pry'
class Puzzle
  attr_accessor :board, :row, :column, :file
  def initialize(file="./test/support/puzzle_missing_each_row.txt")
    @file = file
    @row = []
    @column = []
    board
    row_maker
    column_maker
  end

  def board
    File.open(@file).readlines.map do |line|
      line.delete("\n")
    end.join
  end

  def row_maker
    board.chars.each_slice(9) { |char| @row << char }
  end

  def column_maker
    @column = row[0].zip(row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8])
  end
end
