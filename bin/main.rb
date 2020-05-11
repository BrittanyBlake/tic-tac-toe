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



end
