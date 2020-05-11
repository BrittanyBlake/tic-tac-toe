class Board
  attr_accessor :grid
  def initialize
    @grid = Array.new(3) { Array.new(3, '_') }
  end

  def [](position)
    row, col = position
    @grid[row][col]
  end

  def []=(position, value)
    row, col = position
    @grid[row][col] = value
  end

  def valid?(pos)
    _row, _col = pos
    pos.all? do |i|
      i >= 0 && i < @grid.length
    end
  end

  def empty?(pos)
    self[pos] == '_'
  end

  def place_symbol(pos, symbol)
    raise 'invalid move' if !valid?(pos) || !empty?(pos)
    self[pos] = symbol
  end

  def empty_positions?
    indices = (0...@grid.length).to_a
    positions = indices.product(indices)
    positions.any? { |pos| empty?(pos) }
  end

  def print_board
    @grid.each do |row|
      puts row.join(' ')
    end
  end
end
