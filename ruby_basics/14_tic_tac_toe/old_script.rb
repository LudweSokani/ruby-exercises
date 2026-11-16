# frozen_string_literal: true

# puts("1|2|3 \n" + "-----\n" + "4|5|6 \n" + "-----\n" + "7|8|9")

# puts {[:a, 1] [:b, 2] [:c, 3] [:d, 4] [:e, 5] [:f, 6] [:g, 7] [:h, 8] [:i, 9]}

# Working list of Variables needed:
# Static variables
player_1_ = :X
player_2_ = :O
current_player = player_1_
# contain all possible winning combos in a variable

# Initial value of the board, numbered so player only needs to choose which position they'll take
board = { 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9' }
# board = { 1 => :X, 2 => :X, 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9' }

# Dynamic Variables
turns = 0
position = 0

def display_board(board)
  puts "#{board[1]}|#{board[2]}|#{board[3]}"
  puts '-+-+-'
  puts "#{board[4]}|#{board[5]}|#{board[6]}"
  puts '-+-+-'
  puts "#{board[7]}|#{board[8]}|#{board[9]}"
end

def winner(board, player_symbol)
  winning_combos = [[1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 5, 9], [3, 5, 7]]
  winning_combos.any? do |line|
    line.all? { |position| board[position] == player_symbol }
  end
end

# Building the game loop
loop do
  display_board(board)
  puts "Player #{current_player}, input your desired position:"
  position = gets.chomp.to_i
  turns += 1

  # Checking if the position is already taken, so no one steals positions....
  unless (1..9).include?(position) && board[position].is_a?(String)
    puts "\n !!!!!!! \n Invalid move! That spot is already taken or out of range. Try again.\n !!!!!!! \n "
    next
  end

  board[position] = current_player

  # display_board(board)

  if winner(board, current_player)
    puts "#{current_player} wins!"
    break
  elsif turns == 9
    puts "It's a tie!"
    break
  else
    puts "Next player's turn."
  end

  # Change current player
  current_player = current_player == player_1_ ? player_2_ : player_1_
end

# puts board
