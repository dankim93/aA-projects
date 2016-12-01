require_relative 'deck.rb'
require 'byebug'

class Hand
  attr_accessor :cards, :card_values


  VALUES = ["2","3","4","5","6","7","8","9","10", "J", "Q", "K", "A"]
  SUITES = ["Diamond", "Club", "Heart", "Spade"]



  def initialize(*cards)
    @cards = cards
    @sorted_cards = []
    @card_values = @cards.map { |card| card.value }
    @card_suites = @cards.map { |card| card.suite }
  end

  # def straight_flush
  #   if @cards.all? {|card| card.suite == @cards[0].suite}
  #     sort_cards
  #     if [2,3,4,5,"A"].all? { |card| @card_values.include?(card) }
  #       return true
  #     else
  #       first_card = @sorted_cards[0] #first = 4
  #       idx = VALUES.index(first_card)  #idx = 2
  #       @sorted_cards.each_with_index do |card, idx2|
  #         return false if card.value != VALUES[idx + idx2]
  #       end
  #
  #   end
  #
  #
  # end

  def sort_cards
  #   ind = 0
  #   temp_cards = @cards
  #   while ind < VALUES.length
  #     temp_cards.each do |card|
  #       if card.value == VALUES[ind]
  #         @sorted_cards << card
  #         # temp_cards.delete
  #       end
  #     end
  #     ind += 1
  #   end
  #
  #   @sorted_cards
  end

  # def two_pair
  # end

  def one_pair
    values_hash.any? {|_,v| v > 1 }
  end

  def two_pair
    counter = 0
    values_hash.each do |_,v|
      counter += 1 if v > 1
    end
    return true if counter == 2
    false
  end

  def three_of_a_kind
    values_hash.any? {|_,v| v == 3}
  end

  def values_hash
    values_hash = Hash.new(0)
    @card_values.each do |card|
      values_hash[card] += 1
    end
    values_hash
  end

  def best_hand
    return :three_of_a_kind if three_of_a_kind
    return :two_pair if two_pair
    return :one_pair if one_pair
  end

end
