# frozen_string_literal: true

class Board
  # All the possible winning combos

  # .freeze method was added to make the array immutable, preventing accidental modifications.
  # Otherwise I had an error under this variable.
  WINNING_COMBOS = [[1, 2, 3], [2, 5, 8], [3, 6, 9], [1, 4, 7], [4, 5, 6], [7, 8, 9], [3, 5, 7]].freeze

  # Class method: can be called directly on the class (Board.winning_combos)
  def self.winning_combos
    WINNING_COMBOS
  end

  def initialize
    # initialize the board with the numbers on the grid, so a player can choose easier
    @grid = {
      1 => '1', 2 => '2', 3 => '3',
      4 => '4', 5 => '5', 6 => '6',
      7 => '7', 8 => '8', 9 => '9'
    }
  end

  # Instance methods: for the grid
  def display
    puts "#{@grid[1]}|#{@grid[2]}|#{@grid[3]}"
    puts '-+-+-'
    puts "#{@grid[4]}|#{@grid[5]}|#{@grid[6]}"
    puts '-+-+-'
    puts "#{@grid[7]}|#{@grid[8]}|#{@grid[9]}"
  end

  def valid_move?(position)
    (1..9).include?(position) && @grid[position].is_a?(String)
  end

  def place_mark(position, symbol)
    @grid[position] = symbol
  end

  def winner?(player_symbol)
    self.class.winning_combos.any? do |line|
      line.all? { |position| @grid[position] == player_symbol }
    end
  end
end

class Game
  # Class method: to start a new game
  def self.start
    new.play
  end

  def initialize
    # Instance variables for game
    @board = Board.new
    @Player_1 = :X
    @Player_2 = :O
    @current_player = @Player_1
    @turns = 0
  end

  # Instance method: controls the main game flow
  def play
    loop do
      @board.display
      puts "Player #{@current_player}, input your desired position:"
      position = gets.chomp.to_i

      unless @board.valid_move?(position)
        puts "\n !!!!!!! \n Invalid move! That spot is already taken or out of range. Try again.\n !!!!!!! \n "
        next
      end

      @turns += 1
      @board.place_mark(position, @current_player)

      if @board.winner?(@current_player)
        @board.display
        puts "Player #{@current_player} wins!"
        break
      elsif @turns == 9
        @board.display
        puts "It's a tie!"
        break
      else
        puts "Next player's turn."
        switch_player
      end
    end
  end

  private

  def switch_player
    @current_player = @current_player == @Player_1 ? @Player_2 : @Player_1
  end
end

# Start the game
Game.start
