require_relative '../lib/board.rb'

RSpec.describe Board do
  let(:board) { Board.new }
  let(:grid) { board.instance_variable_get(:@grid) }

  describe '#initialize' do
    it 'should set the grid to a 2D array with 3 rows and 3 columns' do
      expect(grid.length).to eq(3)
      expect(grid[0].length).to eq(3)
    end

    it 'should not set the grid as an empty array' do
      expect(grid).not_to eq([])
    end
  end

  describe '#[]' do
    it 'should accept a pair of indices to represent the chosen position on the board' do
      pos = [0, 0]
      expect(board[pos]).to eq(grid[0][0])
    end
  end

  describe '#[]=' do
    it 'should set the position on the grid to the given symbol' do
      pos = [1, 1]
      grid[1][1] = 'X'
      expect(board[pos]).to eq('X')
    end

    it 'should not set the position on the grid to an incorrect symbol' do
      pos = [1, 1]
      grid[1][1] = 'X'
      expect(board[pos]).not_to eq('O')
    end
  end

  describe '#valid?' do
    it 'should check if the given position exists on the board' do
      pos = [2, 2]
      expect(board.valid?(pos)).to eq(true)
    end

    it 'should return false if the given position does not exist on the board' do
      pos = [3, 3]
      expect(board.valid?(pos)).to eq(false)
    end
  end

  describe '#empty?' do
    it 'should check if the given position was not already chosen' do
      pos = [0, 0]
      grid[0][1] = 'X'
      expect(board.empty?(pos)).to eq(true)
    end

    it 'should return false if the given position was already chosen' do
      pos = [1, 2]
      grid[1][2] = 'X'
      expect(board.empty?(pos)).to eq(false)
    end
  end

  describe '#invalid?' do
    it 'should return false if the given position is on the board' do
      pos = [2, 2]
      expect(board.invalid?(pos)).to eq(false)
    end

    it 'should return true if the given position is not on the board' do
      pos = [3, 2]
      expect(board.invalid?(pos)).to eq(true)
    end

    it 'should return false if the given position was not already chosen' do
      pos = [0, 0]
      grid[0][1] = 'X'
      expect(board.invalid?(pos)).to eq(false)
    end

    it 'should return true if the given position was already chosen' do
      pos = [1, 2]
      grid[1][2] = 'X'
      expect(board.invalid?(pos)).to eq(true)
    end
  end

  describe '#place_symbol' do
    it 'should place the given symbol in the given position' do
      pos = [1, 2]
      symbol = 'X'
      board[pos] = symbol
      expect(grid[1][2]).to eq('X')
    end

    it 'should not place the incorrect symbol in the given position' do
      pos = [1, 2]
      symbol = 'O'
      board[pos] = symbol
      expect(grid[1][2]).not_to eq('X')
    end
  end

  describe '#empty_positions?' do
    it 'should return false if there are no longer any available positions on the board' do
    grid[0][0] = 'X'
    grid[0][1] = 'O'
    grid[0][2] = 'X'
    grid[1][0] = 'O'
    grid[1][1] = 'O'
    grid[1][2] = 'X'
    grid[2][0] = 'O'
    grid[2][1] = 'X'
    grid[2][2] = 'O'
    expect(board.empty_positions?).to eq(false)
    end
    
    it 'should return true if there are any available spaces on the board' do
      grid[0][0] = 'X'
      grid[0][1] = 'O'
      grid[0][2]
      grid[1][0] = 'O'
      grid[1][1] = 'O'
      grid[1][2] = 'X'
      grid[2][0] = 'O'
      grid[2][1] = 'X'
      grid[2][2] = 'O'
      expect(board.empty_positions?).to eq(true)
    end
  end
end
