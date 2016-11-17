class WordChain
  def initialize(filename)
    @words = File.readlines(filename).map(&:chomp)
  end

  def adjacent(word_one)
    potential = @words.select do |word|
      word_one.length == word.length && (word.split('') - word_one.split('')).length == 1
    end
    potential.each do |word|
      count = 0
      word.chars.each_with_index do |chr, idx|
        count += 1 if word_one[idx] != chr
      end
      potential.delete(word) if count > 1
    end
    potential
  end

end

tst = WordChain.new('dictionary.txt')
