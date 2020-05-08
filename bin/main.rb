#!/usr/bin/env ruby

class Interface
  puts "██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗██╗
██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝██║
██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗  ██║
██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝  ╚═╝
╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗██╗
 ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚═╝"

  # get user inputs
  puts 'player 1, please enter your name'
  player1 = gets.chomp.capitalize
  puts 'player 2, please enter your name'
  player2 = gets.chomp.capitalize
  puts "#{player1} is X and #{player2} is O"

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
  puts ' 1 | 2 | 3 '
  puts '---+---+---'
  puts ' 4 | 5 | 6 '
  puts '---+---+---'
  puts ' 6 | 7 | 9 '

  game_over = false

  player_turn = 1

  while game_over == false
    if player_turn.odd?
      puts "#{player_1} choose a position"
      player1_position = gets.chomp
      puts player1_position.to_s
    # check if position is valid
    # display board with updated position
    elsif player_turn.even?
      puts "#{player_2} choose a position"
      player2_position = gets.chomp
      puts player2_position.to_s
      # check if position is valid
      # display board with updated position
    end
    # check for winner or tie
    # if there is a winner or a tie
    # game_over == true if there is a winner or a tie
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
