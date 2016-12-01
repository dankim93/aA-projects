require 'rspec'
require 'tdd'

describe Array do
  describe "#my_uniq" do
    it "return an array with uniq elements" do
      my_array = [1, 2, 1, 3, 3]
      expect(my_array).not_to receive(:uniq)
      expect(my_array.my_uniq).to eq([1, 2, 3])
    end
  end

  describe "#two_sum" do
    it "returns the indeces of a pair that sums up to zero" do
      my_array = [-1, 0, 2, -2, 1]
      expect(my_array.two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#my_transpose" do
    it "it transposes a 2D array" do
      rows = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]]

    cols = [
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]
      expect(rows.my_transpose).to eq(cols)
    end

    describe "#stock_picker" do
      it "returns the most profittable pair of
       days to buy then sell a stock" do
       prices = [34, 67,23, 40,1,50]
       expect(prices.stock_picker).to eq([4,5])
      end
    end
  end

end

describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }

  describe '#initialize' do
    it 'sets the stacks to be an array of three arrays' do
      expect(game.tower).to be_a(Array)
    end
  end

  describe '#move' do
    it 'should not move a stack if the end position top stack
      is greater than the current position top stack' do
      game.tower[2].push(1)
      game.tower[0].pop
      expect { game.move(0, 2) }.to raise_error("Invalid Move!")
    end

    it "should not take from an empty tower number" do
      expect { game.move(1, 2) }.to raise_error("Empty starting array")
    end

    it "should move a smaller stack to a larger stack" do
      game.tower[2].push(2)
      game.tower[0].delete(2)
      expect{game.move(0, 2)}.not_to raise_error()
      expect(game.tower[2]).to eq([2,1])
    end
  end

  describe '#won' do
    it "should return true if index 1 or 2 contains array of [3,2,1]" do
      game.tower[2] << 3
      game.tower[2] << 2
      expect(game.won?).to be_false
      game.tower[2] << 1
      game.tower[0] = []
      expect(game.won?).to be_truthy
    end
  end

end
