require 'rspec'
require 'player'

describe Player do
  subject(:player){ Player.new(double_hand, 50) }
  let(:card1){ double("card1", value: 2, suite: "Heart")}
  let(:card2){ double("card2", value: 3, suite: "Heart")}
  let(:card3){ double("card3", value: 4, suite: "Heart")}
  let(:card4){ double("card4", value: 5, suite: "Heart")}
  let(:card5){ double("card5", value: 6, suite: "Heart")}
  let(:double_hand){ double('hand', cards: [card1,card2,card3,card4,card5]) }
  describe "#initialize" do
    it "sets a hand to the player's hand" do
      expect(player.hand).to eq(double_hand)
    end
  end


end
