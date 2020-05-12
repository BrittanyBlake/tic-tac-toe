require_relative '../lib/logic.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

RSpec.describe Logic do
  let(:logic) {Logic.new('Player1', 'X', 'Player2', 'O')}
  let(:board) {logic.instance_variable_get(:@board)}

  describe '#win_row?' do
    it 'should accept symbol as an argument' do
      expect{logic.win_row?(:X)}.not_to raise_error
    end

    it 'should return true if any row is filled with given symbol' do
      board[[0, 0]] = 'X'
      board[[0, 1]] = 'X'
      board[[0, 2]] = 'X'
      expect(logic.win_row?('X')).to eq(true)
    end

    it 'should return false if the row is not filled with given symbol' do
      board[[0, 0]] = 'X'
      board[[0, 1]] = 'O'
      board[[0, 2]] = 'X'
      expect(logic.win_row?('X')).to eq(false)
    end
  end
end