class Array

  def my_uniq
    result = []
    self.each do |el|
      result << el unless result.include?(el)
    end

    result.uniq
  end

  def two_sum
    result = []
    for idx in 0..self.length - 2
      for idx2 in (idx + 1)..self.length - 1
        result << [idx, idx2] if self[idx] + self[idx2] == 0
      end
    end

    result
  end

  def my_transpose
    result = Array.new(self.size) {[]}
    for idx in 0..self[0].length - 1
      for idx2 in 0..self.length - 1
        result[idx2] << self[idx][idx2]
      end
    end
    result
  end

  def stock_picker
    most_profittable_days = []
    profit = nil
    self[0..-2].each_with_index do |price, day|
      self.each_with_index do |price2, day2|
        next if day2 <= day
        current_profit = price2 - price
        if profit.nil? || (current_profit > profit)
          most_profittable_days = [day, day2]
          profit = current_profit
        end
      end
    end

    most_profittable_days
  end

end

class TowersOfHanoi
  attr_accessor :tower

  def initialize
    @tower = [[3,2,1], [], []]
  end

  def move(start, end_pos)
    raise "Empty starting array" if @tower[start].empty?
    raise "Invalid Move!" if @tower[start].last > @tower[end_pos].last
    @tower[end_pos] << @tower[start].pop
  end

  def won?
    if tower[1] == [3,2,1] || tower[2] == [3,2,1]
      return true
    else
      false
    end
  end

end
