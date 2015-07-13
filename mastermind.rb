require './PegRow'

class Mastermind

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
          @guesses.feedback[index] = "R"
        end
      }
  end

  def check_peg

  end

  def is_correct_guess?

  end


  game = Mastermind.new
  (0..12).each { |i|
    game.check_guess(game.get_user_guess(i))

  }

end
