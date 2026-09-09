class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(9, " ")
  end

  def display
    puts "\n"
    puts " #{@grid[0]} | #{@grid[1]} | #{@grid[2]} "
    puts "-----------"
    puts " #{@grid[3]} | #{@grid[4]} | #{@grid[5]} "
    puts "-----------"
    puts " #{@grid[6]} | #{@grid[7]} | #{@grid[8]} "
    puts "\n"
  end

  def update(position, marker)
    if position.between?(1, 9) && @grid[position - 1] == " "
      @grid[position - 1] = marker
      true
    else
      false
    end
  end

  def win?(marker)
    winning_combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # Columns
      [0, 4, 8], [2, 4, 6]             # Diagonals
    ]
    winning_combinations.any? do |combo|
      combo.all? { |index| @grid[index] == marker }
    end
  end

  def draw?
    !@grid.include?(" ") && !win?("X") && !win?("O")
  end
end

class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end

class Game
  def initialize
    @board = Board.new
    setup_players
  end

  def play
    puts "Welcome to Tic Tac Toe!"
    @board.display

    loop do
      turn
      if @board.win?(@current_player.marker)
        @board.display
        puts "#{@current_player.name} wins!"
        break
      elsif @board.draw?
        @board.display
        puts "It's a draw!"
        break
      end
      switch_player
      @board.display
    end
  end

  private

  def setup_players
    puts "Enter name for Player 1 (X):"
    name1 = gets.chomp
    name1 = "Player 1" if name1.empty?
    @player1 = Player.new(name1, "X")

    puts "Enter name for Player 2 (O):"
    name2 = gets.chomp
    name2 = "Player 2" if name2.empty?
    @player2 = Player.new(name2, "O")

    @current_player = @player1
  end

  def turn
    loop do
      puts "#{@current_player.name} (#{@current_player.marker}), choose a position (1-9):"
      position = gets.chomp.to_i
      if @board.update(position, @current_player.marker)
        break
      else
        puts "Invalid move. Please try again."
      end
    end
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end
end

if __FILE__ == $0
  Game.new.play
end
