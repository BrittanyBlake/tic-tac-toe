#!/usr/bin/env ruby

require_relative '../lib/logic.rb'
require_relative '../lib/player.rb'
require_relative '../lib/board.rb'

puts "██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗██╗
██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝██║
██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗  ██║
██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝  ╚═╝
╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗██╗
 ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚═╝"

puts 'Player 1, please enter your name'
player1 = gets.chomp.capitalize
until !player1.empty?
  puts "Please enter a name"
  player1 = gets.chomp.capitalize
end


puts "#{player1} your symbol will be 'X'"
symbol1 = 'X'

puts 'Player 2, please enter your name'
player2 = gets.chomp.capitalize
until !player2.empty?
  puts "Please enter a name"
end

puts "#{player2} your symbol will be 'O'"
symbol2 = 'O'

puts "TTTTTTTTTTTTTTTTTTTTTTT  iiii                           TTTTTTTTTTTTTTTTTTTTTTT                                        TTTTTTTTTTTTTTTTTTTTTTT
T:::::::::::::::::::::T i::::i                          T:::::::::::::::::::::T                                        T:::::::::::::::::::::T
T:::::::::::::::::::::T  iiii                           T:::::::::::::::::::::T                                        T:::::::::::::::::::::T
T:::::TT:::::::TT:::::T                                 T:::::TT:::::::TT:::::T                                        T:::::TT:::::::TT:::::T
TTTTTT  T:::::T  TTTTTTiiiiiii     cccccccccccccccc     TTTTTT  T:::::T  TTTTTTaaaaaaaaaaaaa      cccccccccccccccc     TTTTTT  T:::::T  TTTTTTooooooooooo       eeeeeeeeeeee
        T:::::T        i:::::i   cc:::::::::::::::c             T:::::T        a::::::::::::a   cc:::::::::::::::c             T:::::T      oo:::::::::::oo   ee::::::::::::ee
        T:::::T         i::::i  c:::::::::::::::::c             T:::::T        aaaaaaaaa:::::a c:::::::::::::::::c             T:::::T     o:::::::::::::::o e::::::eeeee:::::ee
        T:::::T         i::::i c:::::::cccccc:::::c             T:::::T                 a::::ac:::::::cccccc:::::c             T:::::T     o:::::ooooo:::::oe::::::e     e:::::e
        T:::::T         i::::i c::::::c     ccccccc             T:::::T          aaaaaaa:::::ac::::::c     ccccccc             T:::::T     o::::o     o::::oe:::::::eeeee::::::e
        T:::::T         i::::i c:::::c                          T:::::T        aa::::::::::::ac:::::c                          T:::::T     o::::o     o::::oe:::::::::::::::::e
        T:::::T         i::::i c:::::c                          T:::::T       a::::aaaa::::::ac:::::c                          T:::::T     o::::o     o::::oe::::::eeeeeeeeeee
        T:::::T         i::::i c::::::c     ccccccc             T:::::T      a::::a    a:::::ac::::::c     ccccccc             T:::::T     o::::o     o::::oe:::::::e
      TT:::::::TT      i::::::ic:::::::cccccc:::::c           TT:::::::TT    a::::a    a:::::ac:::::::cccccc:::::c           TT:::::::TT   o:::::ooooo:::::oe::::::::e
      T:::::::::T      i::::::i c:::::::::::::::::c           T:::::::::T    a:::::aaaa::::::a c:::::::::::::::::c           T:::::::::T   o:::::::::::::::o e::::::::eeeeeeee
      T:::::::::T      i::::::i  cc:::::::::::::::c           T:::::::::T     a::::::::::aa:::a cc:::::::::::::::c           T:::::::::T    oo:::::::::::oo   ee:::::::::::::e
      TTTTTTTTTTT      iiiiiiii    cccccccccccccccc           TTTTTTTTTTT      aaaaaaaaaa  aaaa   cccccccccccccccc           TTTTTTTTTTT      ooooooooooo       eeeeeeeeeeeeee"
puts
puts "Let's play!"
puts 
puts "Here are position coordinates:"
puts
puts ' 0 0 | 0 1 | 0 2 '
puts '-----+-----+----'
puts ' 1 0 | 1 1 | 1 2 '
puts '-----+-----+----'
puts ' 2 0 | 2 1 | 2 2 '

new_game = Logic.new(player1, player2, symbol1, symbol2)

game_over = false
turn = 1

until game_over == true

  puts 
  new_game.board.print_board
  puts 

  if turn.odd?
    puts "#{player1} please enter two space separated numbers representing a position in the format `row col` (example: 0 0)"
    position = gets.chomp.split(' ').map(&:to_i)
    new_game.board.place_symbol(position, :X)
  elsif turn.even?
    puts "#{player2} please enter two space separated numbers representing a position in the format `row col` (example: 0 0)"
    position = gets.chomp.split(' ').map(&:to_i)
    new_game.board.place_symbol(position, :O)
  end

  if new_game.win?(:X)
    puts "#{player1.upcase} WON!!"
    game_over = true
  elsif new_game.win?(:O)
    puts "#{player2.upcase} WON!!"
    game_over = true
  elsif new_game.board.empty_positions? == false
    puts 'ITS A TIE!'
    game_over = true
  else
    turn += 1
  end



end
