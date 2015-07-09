require './PegRow'

class Mastermind
  attr_accessor :guesses, :secret
  def initialize
    @guesses = Array.new(12){PegRow.new}
    @secret = PegRow.new
  end



  game = Mastermind.new
  puts game.guesses
  puts "#{game.secret} = secret"
end
