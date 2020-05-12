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

   

end