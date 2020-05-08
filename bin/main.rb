#!/usr/bin/env ruby

class Interface
  # user welcome

  # get user inputs
  puts 'player 1, please enter your name'
  player1 = gets.chomp.capitalize
  puts 'player 2, please enter your name'
  player2 = gets.chomp.capitalize
  puts "#{player1} is X and #{player2} is O"

  puts "Let's play!"

  # display board

  game_over = false

  player_turn = 1

  while game_over = false
    if player_turn.odd?
      puts "#{player_1} choose a position"
      player1_position = gets.chomp
    # check if position is valid
    # display board with updated position
    elsif player_turn.even?
      puts "#{player_2} choose a position"
      player2_position = gets.chomp
      # check if position is valid
      # display board with updated position
    end
    # check for winner or tie
    # if there is a winner or a tie
    game_over = true
    # if winner is player 1"
    puts "#{player_1} won!"
    # if winner is player 2"
    puts "#{player_2} won!"
    # if there is a tie
    puts 'There was a tie!'
    # if there is no winner or tie game_over is still false
    player_turn += 1

  end
end
