require_relative 'card.rb'
require 'byebug'

class Deck
  VALUES = ["2","3", "4", "5", "6", "7", "8", "9","10", "J", "Q", "K", "A"]
  SUITES = ["Diamond", "Club", "Heart", "Spade"]

  def initialize
    @deck = Deck.populate_deck
  end

  def self.populate_deck
    cards_array = []
    VALUES.each do |value|
      SUITES.each do |suite|
        cards_array << Card.new(value, suite)
      end
    end
    cards_array
  end


end
