require 'deck'
require 'rspec'

describe Deck do
  subject(:deck) { Deck.new }

  describe '#initialize' do
    it 'calls on populate_deck' do
      expect(Deck).to receive(:populate_deck)
      deck
    end
  end

end
