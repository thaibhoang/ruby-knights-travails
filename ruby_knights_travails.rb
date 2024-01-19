class KnightsTravails
  def initialize 
    @board = Array.new(8).map{|row| row = Array.new(8, 0)}
    @queue = []
    @possibale_move = [[1, 2], [-1, 2], [1, -2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]
  end

  def find_move(x, y)
    res = []
    @possibale_move.each do |i, j|
      res << [x + i, y + j] if (x + i).between?(0,7) && (y + j).between?(0,7) && @board[x + i][y + j] == 0
    end
    res
  end

  def reset
    for i in 0..7
      for j in 0..7
        @board[i][j] = 0
      end
    end
  end

  def show_road(moves, road)
    puts "You made it in #{moves+1} moves!  Here's your path:"
    road.each {|x| p x}
  end

  def knight_moves(start, finish)
    reset()
    @queue = []
    @queue = [[start, 0, [start]]]
    while !@queue.empty?
      position, moves, road = @queue.shift
      find_move(position[0], position[1]).each do |x, y|
        if (x == finish[0] && y == finish[1])
          road << [x, y] 
          show_road(moves, road)
          return
        end
        @board[x][y] = 1
        @queue << [[x, y], moves + 1, road + [[x, y]]]
      end
    end
  end
end

game = KnightsTravails.new
game.knight_moves([0,0],[7,7])
game.knight_moves([3,3],[0,0]) 
game.knight_moves([0,0],[3,3])