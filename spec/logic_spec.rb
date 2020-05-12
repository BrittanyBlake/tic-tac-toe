require_relative '../lib/logic.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

RSpec.describe Logic do
  let(:logic) { Logic.new('Player1', 'X', 'Player2', 'O') }
  let(:board) { logic.instance_variable_get(:@board) }

  describe '#win_row?' do
    it 'should accept symbol as an argument' do
      expect { logic.win_row?(:X) }.not_to raise_error
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

  describe '#win_col?' do
    it 'should accept symbol as an argument' do
      expect { logic.win_col?(:X) }.not_to raise_error
    end

    it 'should return true if any col is filled with given symbol' do
      board[[0, 0]] = 'X'
      board[[1, 0]] = 'X'
      board[[2, 0]] = 'X'
      expect(logic.win_col?('X')).to eq(true)
    end

    it 'should return false if the col is not filled with given symbol' do
      board[[0, 0]] = 'X'
      board[[1, 0]] = 'O'
      board[[2, 0]] = 'X'
      expect(logic.win_col?('X')).to eq(false)
    end
  end

  describe '#win_diagonal?' do
    it 'should accept symbol as an argument' do
      expect { logic.win_diagonal?(:X) }.not_to raise_error
    end

    context 'direction: left to right' do
      it 'should return true if there is three of the given symbol in a row diagonaly' do
        board[[0, 0]] = 'X'
        board[[1, 1]] = 'X'
        board[[2, 2]] = 'X'
        expect(logic.win_diagonal?('X')).to eq(true)
      end

      it 'should return false if there is not three of the given symbol in a row diagonaly' do
        board[[0, 0]] = 'X'
        board[[1, 1]] = 'O'
        board[[2, 2]] = 'X'
        expect(logic.win_diagonal?('X')).to eq(false)
      end
    end

    context 'direction: right to left' do
      it 'should return true if there is three of the given symbol in a row diagonaly' do
        board[[0, 2]] = 'X'
        board[[1, 1]] = 'X'
        board[[2, 0]] = 'X'
        expect(logic.win_diagonal?('X')).to eq(true)
      end

      it 'should return false if there is not three of the given symbol in a row diagonaly' do
        board[[0, 2]] = 'X'
        board[[1, 1]] = 'O'
        board[[2, 0]] = 'X'
        expect(logic.win_diagonal?('X')).to eq(false)
      end
    end
  end

  describe '#win?' do
    it 'should accept symbol as an argument' do
      expect { logic.win?(:O) }.not_to raise_error
    end

    it 'should return true if any row is filled with given symbol' do
      board[[0, 0]] = 'X'
      board[[0, 1]] = 'X'
      board[[0, 2]] = 'X'
      expect(logic.win?('X')).to eq(true)
    end

    it 'should return false if the row is not filled with given symbol' do
      board[[0, 0]] = 'X'
      board[[0, 1]] = 'O'
      board[[0, 2]] = 'X'
      expect(logic.win?('X')).to eq(false)
    end

    it 'should return true if any col is filled with given symbol' do
      board[[0, 0]] = 'X'
      board[[1, 0]] = 'X'
      board[[2, 0]] = 'X'
      expect(logic.win?('X')).to eq(true)
    end

    it 'should return false if the col is not filled with given symbol' do
      board[[0, 0]] = 'X'
      board[[1, 0]] = 'O'
      board[[2, 0]] = 'X'
      expect(logic.win?('X')).to eq(false)
    end

    context 'direction: left to right' do
      it 'should return true if there is three of the given symbol in a row diagonaly' do
        board[[0, 0]] = 'X'
        board[[1, 1]] = 'X'
        board[[2, 2]] = 'X'
        expect(logic.win?('X')).to eq(true)
      end

      it 'should return false if there is not three of the given symbol in a row diagonaly' do
        board[[0, 0]] = 'X'
        board[[1, 1]] = 'O'
        board[[2, 2]] = 'X'
        expect(logic.win?('X')).to eq(false)
      end
    end

    context 'direction: right to left' do
      it 'should return true if there is three of the given symbol in a row diagonaly' do
        board[[0, 2]] = 'X'
        board[[1, 1]] = 'X'
        board[[2, 0]] = 'X'
        expect(logic.win_diagonal?('X')).to eq(true)
      end

      it 'should return false if there is not three of the given symbol in a row diagonaly' do
        board[[0, 2]] = 'X'
        board[[1, 1]] = 'O'
        board[[2, 0]] = 'X'
        expect(logic.win_diagonal?('X')).to eq(false)
      end
    end
  end
end
