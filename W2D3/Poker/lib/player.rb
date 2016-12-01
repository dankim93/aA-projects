require_relative 'hand.rb'

class Player
  attr_accessor :hand, :pot

  def initialize(hand, pot)
    @hand = hand #instance
    @pot = pot
  end

  def discard
    puts "Enter a card in 'value, suite' that you would like to discard."
    value_suite = gets.chomp.split(",").map(&:capitalize)
    delete_card(value_suite)
  end

  def delete_card(value_suite)
    value, suite = value_suite
    @hand.cards.reject! {|card| card.value == value && card.suite == suite}
  end


  def get_move
    puts "Would you like to raise, fold, or see?"
    response = gets.chomp.downcase
    case response
    when "fold"
      return :fold
    when "see"
      return :see
    when "raise"
      return :raise
    end
  end
end
