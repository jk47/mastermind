require './PegRow'

class Mastermind

  attr_accessor :guesses, :secret

  def initialize
    @guesses = Array.new(12){PegRow.new}
    @secret = PegRow.new
  end

  def get_user_guess(guess_number)
    puts "Please enter your guess."
    guess = gets.chomp.split

  end



  game = Mastermind.new
  (0..12).each { |i|
    game.get_user_guess(i)
  }
  puts game.guesses
  puts "#{game.secret} = secret"
end
