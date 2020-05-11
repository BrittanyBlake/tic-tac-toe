require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

class Logic
  attr_reader :player1, :player2, :current_player
  attr_accessor :board

  def initialize(name1, symbol1, name2, symbol2)
    @player1 = Player.new(name1, symbol1)
    @player2 = Player.new(name2, symbol2)
    @board = Board.new
  end

  def each_play(position, symbol)
    @board.place_symbol(position, symbol)
    @board.print_board
  end

  def win_row?(symbol)
    @board.grid.any? { |row| row.all?(symbol) }
  end

  def win_col?(symbol)
    @board.grid.transpose.any? { |col| col.all?(symbol) }
  end

 
end
