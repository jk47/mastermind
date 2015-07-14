require './PegRow'

class Mastermind
  COLORS = %w(R O Y G B I)

  attr_accessor :guesses, :secret

  def initialize
    @guesses = Array.new(12){PegRow.new}
    @secret = PegRow.new
  end

  def get_user_guess(guess_number)
    puts "Please enter your guess."
    gets.chomp.split
  end

  def check_guess(guess)
      guess.each_with_index {|g, index|
        if g == @secret.row[index]
          @guesses.feedback << "COLOR"
        elsif @secret.row.include?(g)
          @guesses.feedback << "WHITE"
        end

      }
  end

  def print_board
    puts @guesses[0].feedback
  end

  def check_peg

  end

  def is_correct_guess?

  end


  game = Mastermind.new
  (0..12).each { |i|
    game.check_guess(game.get_user_guess(i))
    game.print_board
  }

end
