require 'rspec'
require 'card'

describe Card do
  subject(:queen_spade) {Card.new("Q", "Spade")}
  describe "#initialize" do
      it "gives a card a value and a suite" do
        expect(queen_spade.value).to eq("Q")
        expect(queen_spade.suite).to eq("Spade")
      end
  end
end
