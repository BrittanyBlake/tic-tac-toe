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
while player1.empty?
  puts 'Please enter a name'
  player1 = gets.chomp.capitalize
end

puts "#{player1} your symbol will be 'X'"
symbol1 = 'X'

puts 'Player 2, please enter your name'
player2 = gets.chomp.capitalize
puts 'Please enter a name' while player2.empty?

puts "#{player2} your symbol will be 'O'"
symbol2 = 'O'

puts '_______  ___   _______    _______  _______  _______    _______  _______  _______'
puts '|       ||   | |       |  |       ||   _   ||       |  |       ||       ||       '
puts '|_     _||   | |       |  |_     _||  |_|  ||       |  |_     _||   _   ||    ___'
puts ' |   |  |   | |       |    |   |  |       ||       |    |   |  |  | |  ||   |___'
puts ' |   |  |   | |      _|    |   |  |       ||      _|    |   |  |  |_|  ||    ___'
puts ' |   |  |   | |     |_     |   |  |   _   ||     |_     |   |  |       ||   |___'
puts ' |___|  |___| |_______|    |___|  |__| |__||_______|    |___|  |_______||_______|'

puts
puts "Let's play!"
puts
puts 'Here are position coordinates:'
puts
puts ' 0 0 | 0 1 | 0 2 '
puts '-----+-----+----'
puts ' 1 0 | 1 1 | 1 2 '
puts '-----+-----+----'
puts ' 2 0 | 2 1 | 2 2 '

new_game = Logic.new(player1, player2, symbol1, symbol2)

game_over = false
turn = 1
inputs = '012021102200'
i = false
j = false
until game_over
  puts
  puts new_game.board.print_board
  puts

  if turn.odd?
    puts "#{player1} please enter two numbers representing a position in the format `row col` "
    position1 = gets.chomp.split('')
    while i == false
      if !inputs.include?(position1.join(''))
        puts 'Please only use numbers'
        position1 = gets.chomp.split('')
      elsif position1.join('').to_s.length != 2
        puts 'Incorrect input! Please enter 2 numbers'
        position1 = gets.chomp.split('')
      else
        i = true
      end
    end
    i = false
    while new_game.board.invalid?(position1.map(&:to_i))
      puts 'position not valid please try again'
      position1 = gets.chomp.split('').map(&:to_i)
    end
    new_game.board.place_symbol(position1.map(&:to_i), :X)

  elsif turn.even?
    puts "#{player2} please enter two numbers representing a position in the format `row col`"
    position2 = gets.chomp.split('')
    while j == false
      if !inputs.include?(position2.join(''))
        puts 'Please only use numbers'
        position2 = gets.chomp.split('')
      elsif position2.join('').to_s.length != 2
        puts 'Incorrect input! Please enter 2 numbers'
        position2 = gets.chomp.split('')
      else
        j = true
      end
    end
    j = false
    while new_game.board.invalid?(position2.map(&:to_i))
      puts 'position not valid please try again'
      position2 = gets.chomp.split('').map(&:to_i)
    end
    new_game.board.place_symbol(position2.map(&:to_i), :O)
  end

  if new_game.win?(:X)
    puts new_game.board.print_board
    puts "#{player1.upcase} WON!!"
    game_over = true
  elsif new_game.win?(:O)
    puts new_game.board.print_board
    puts "#{player2.upcase} WON!!"
    game_over = true
  elsif new_game.board.empty_positions? == false
    puts new_game.board.print_board
    puts 'ITS A TIE!'
    game_over = true
  else

    turn += 1

  end

end
