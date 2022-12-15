# class for the whole 'tic tac toe' game
class Game
  def initialize
    @board = "\n\t  1 | 2 | 3 \n\t --- --- ---\n\t  4 | 5 | 6 \n\t --- --- ---\n\t  7 | 8 | 9 \n\n"
    introduce_game
    player1 = gets.strip
    loop do
      break if player1.downcase == 'o' || player1.downcase == 'x'

      print 'Invalid choice. Try again (Choose your letter: o / x): '
      player1 = gets.strip
    end
    @player1 = player1
    @player2 = (@player1 == 'o' ? 'x' : 'o')
    @winner = false
    inform(@player1, @player2)
  end

  def introduce_game
    puts "\n  ****TIC TAC TOE GAME****"
    puts @board
    puts 'Player1: Choose your letter: o / x'
  end

  def inform(player1, player2)
    print "Player1: #{player1} Player2: #{player2} >> Press enter to agree and start game"
    gets
    play_game
  end

  def play_game
    player = 1
    9.times do
      return if @winner == true

      case player
      when 1
        round(@player1)
        player = 2
      when 2
        round(@player2)
        player = 1
      end
    end
    announce_game_over
  end

  def round(player)
    print "#{player}: choose your position on the board: "
    position = gets.strip
    until position.to_i > 0 && @board.include?(position) do
      print 'Invalid choice. Try again: '
      position = gets.strip
    end
    @board[@board.index(position)] = player
    puts @board
    check_for_winner(player)
  end

  def check_for_winner(player)
    p = player
    if (@board[4] == p && @board[8] == p && @board[12] == p) ||
       (@board[32] == p && @board[36] == p && @board[40] == p) ||
       (@board[60] == p && @board[64] == p && @board[68] == p) ||
       (@board[4] == p && @board[36] == p && @board[68] == p) ||
       (@board[12] == p && @board[36] == p && @board[60] == p) ||
       (@board[4] == p && @board[32] == p && @board[60] == p) ||
       (@board[8] == p && @board[36] == p && @board[64] == p) ||
       (@board[12] == p && @board[40] == p && @board[68] == p)
      @winner = true
      announce_game_over(player)
    end
  end

  def announce_game_over(player = nil)
    if @winner == true
      puts "Player '#{player}' is the winner"
    else
      puts "It's a tie"
    end
    puts 'GAME OVER'
  end
end

Game.new
