class Board
  attr_reader :grid
  attr_writer :grid

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

  def invalid?(pos)
    !valid?(pos) || !empty?(pos)
  end

  def place_symbol(pos, symbol)
    self[pos] = symbol
  end

  def empty_positions?
    indices = (0...@grid.length).to_a
    positions = indices.product(indices)
    positions.any? { |pos| empty?(pos) }
  end

  def print_board
    <<~MLS
      #{@grid[0][0]} | #{@grid[0][1]} | #{@grid[0][2]}
      --+---+--
      #{@grid[1][0]} | #{@grid[1][1]} | #{@grid[1][2]}
      --+---+--
      #{@grid[2][0]} | #{@grid[2][1]} | #{@grid[2][2]}
    MLS
  end
end
