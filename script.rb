class Game
    @@board = "\n\t  1 | 2 | 3 \n\t --- --- ---\n\t  4 | 5 | 6 \n\t --- --- ---\n\t  7 | 8 | 9 "
    attr_accessor :player
    
    def initialize(player = gets.strip)
      player = 'o' if player == ""
      @player = player
    end
    
    def inform1
        puts "Player1: #{@player} >> Press enter to agree and continue"
        gets
    end
  
    def inform2
        puts "Player2: #{@player} >> Press enter to agree and start game"
        gets
    end
    
    def round
      @@board = @@board.split
      print "#{@player}: choose your position on the board: "
      position = gets.strip.to_i
      until position > 0 && position < 10 && position.class == Integer && @@board.include?("#{position}") do
          puts "Invalid choice. Try again"
          position = gets.strip.to_i
      end
          
      @@board.insert((@@board.index("#{position}")+1), "#{@player}").delete_at(@@board.index("#{position}"))
       @@board = @@board.insert(0, "\n\t ").insert(6, "\n\t").insert(10, "\n\t ").insert(16, "\n\t").insert(20, "\n\t ").join(" ")
      puts @@board + "\n\n"
  end
    
    def self.board
      @@board
    end
end
  
puts "\n****TIC TAC TOE GAME****"
puts Game.board
puts "\nPlayer1: Choose your letter: o / x"
player1 = Game.new
puts "\nPlayer2: Choose your letter: o / x"
player2 = Game.new
if player1.player == 'o' && player2.player == 'o'
    player2.player = 'x'
elsif player1.player == 'x' && player2.player == 'x'
    player2.player = 'o'
end
player1.inform1
player2.inform2
  
player = 1
9.times do
    case player
    when 1
      player1.round
      player = 2
    when 2
      player2.round
      player = 1
    end
end
puts "END GAME"