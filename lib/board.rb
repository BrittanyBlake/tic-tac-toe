
class Board
  attr_accessor :grid
  def initialize
    @grid = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
  end

  def display
    "1 | 2 | 3 \n --+---+--- \n 4 | 5 | 6\n --+---+--- \n 7 | 8 | 9"
  end

  def valid?(position)
    indices = "1,2,3,4,5,6,7,8,9"
    row1 = "123"
    row2 = "456"
    row3 = "789"
    vert_idx = 0
    if indices.include?(position)
      vert_idx = 0 if row1.include?(position)
      vert_idx = 1 if row1.include?(position)
      vert_idx = 2 if row1.include?(position)

      @grid[vert_idx][position.to_i - 1] = "X" if vert_idx == 0
      @grid[vert_idx][position.to_i - 4] = "X" if vert_idx == 1
      @grid[vert_idx][position.to_i - 7] = "X" if vert_idx == 2

    end
  end

 # def empty?(position)
#
 # end
end