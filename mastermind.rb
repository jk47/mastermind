require './PegRow'

class Mastermind
  COLORS = %w(R O Y G B I)

  attr_accessor :guesses, :secret

  def initialize
    @guesses = Array.new(12){PegRow.new}
    @secret = PegRow.new
    @secret.row[0] = "G"
    @secret.row[1] = "B"
    @secret.row[2] = "G"
    @secret.row[3] = "B"
  end

  def get_user_guess(guess_number)
    puts "COLOR CHOICES: #{COLORS.join(' ')}"
    puts "Please enter your guess."
    @guesses[guess_number].row = gets.chomp.split
  end

  def check_guess(guess, row_num)
      guess.each_with_index {|g, index|
        if g == @secret.row[index]
          @guesses[row_num].feedback << "COLOR"
        elsif @secret.row.include?(g)
          @guesses[row_num].feedback << "WHITE"
        end
      }
        # If all of the feedback are 'color' the game is over
        return true if @guesses[row_num].feedback.uniq.length == 1
        else return false



  end

  def print_board
    puts
    puts "BOARD: "
    puts
    (0...12).each { |i|
      print "#{@guesses[i].row.join(" ")} :: #{@guesses[i].feedback.join(" ")}"
      puts
    }
    puts "--------------------------------"
    puts
  end

  def end_game
    print_board
    puts "GAME OVER THANKS"
  end



  game = Mastermind.new
  (0..12).each { |i|
    if game.check_guess(game.get_user_guess(i), i)
      game.end_game
      break
    end
    game.print_board
  }

end
