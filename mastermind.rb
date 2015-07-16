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

  game = Mastermind.new
  (0..12).each { |i|
    game.check_guess(game.get_user_guess(i), i)
    game.print_board
  }

end
