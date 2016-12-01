require 'rspec'
require 'hand'
require 'byebug'

describe Hand do
  let(:card1){ Card.new(2, "Club") }
  let(:card2){ Card.new(3, "Club") }
  let(:card3){ Card.new(4, "Club") }
  let(:card4){ Card.new(5, "Club") }
  let(:card5){ Card.new("A", "Club") }
  subject(:hand){ Hand.new(card2, card3, card1, card4, card5) }

  describe "#initialize" do
    it "creates an array of five cards" do
      expect(hand.cards.length).to eq(5)
    end
  end

  # describe "sort_cards" do
  #   it "sorts cards by value" do
  #     hand.sort_cards
  #     expect(hand.cards).to eq([card1,card2,card3,card4,card5])
  #   end
  # end

  describe '#one_pair' do
    let(:card1){ Card.new(2, "Club") }
    let(:card2){ Card.new(2, "Heart") }
    let(:one_pair_hand) { Hand.new(card1, card2, card3, card4, card5) }
    it "returns true if there are two of the same value" do
      expect(one_pair_hand.one_pair).to be(true)
    end
  end

  describe '#cards_value' do
    it "returns the values of the hand of cards" do
      expect(hand.card_values).to eq([3, 4, 2, 5, "A"])
    end
  end

  describe "#two_pair" do
    let(:card1){ Card.new(2, "Club") }
    let(:card2){ Card.new(2, "Heart") }
    let(:card3){ Card.new(3, "Club") }
    let(:card4){ Card.new(3, "Heart") }
    let(:two_pair_hand) { Hand.new(card1, card2, card3, card4, card5) }
    it "returns true if there are two pairs of pairs" do
      expect(two_pair_hand.two_pair).to be(true)
    end
  end

  describe '#three_of_a_kind' do
    let(:card1){ Card.new(2, "Club") }
    let(:card2){ Card.new(2, "Heart") }
    let(:card3){ Card.new(2, "Spade") }
    let(:card4){ Card.new(3, "Heart") }
    let(:three_pair_hand) { Hand.new(card1, card2, card3, card4, card5) }
    it "returns true if there are three of a kind" do
      expect(three_pair_hand.three_of_a_kind).to be(true)
    end
  end




end
