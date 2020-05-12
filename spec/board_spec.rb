require_relative '../lib/board.rb'

RSpec.describe Board do
    let(:board) {Board.new}
    let(:grid) {board.instance_variable_get(:@grid)}

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
        pos =[1, 1]
        grid[1][1] = 'X'
        expect(board[pos]).to eq('X')
      end

      it 'should not set the position on the grid to an incorrect symbol' do
        pos =[1, 1]
        grid[1][1] = 'X'
        expect(board[pos]).not_to eq('O')
      end
    end

end