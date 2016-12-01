class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(12) { [:stone, :stone, :stone, :stone] }.insert(6, Array.new).push(Array.new)
    @current = name1
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1,14)
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    idx = start_pos

    until stones.empty?
      idx += 1
      idx = idx % 13 - 1 if idx > 13
      if idx == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif idx == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[idx] << stones.pop
      end

    end

    render
    next_turn(idx)

  end

  def next_turn(end_idx)
    # helper method to determine what #make_move returns
    if end_idx == 6 || end_idx == 13
       # ended on store -- get to choose where to start again
       :prompt
     elsif @cups[end_idx].count == 1
       # ended on empty cup -- switches players' turns
       :switch
     else
       # ended on cup with stones in it -- automatically starts there
       end_idx
     end
  end



  def render
    # print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    # puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    # print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    # puts ""
    # puts ""
  end

  def one_side_empty?
    @cups.take(6).all? { |cup| cup.empty? } ||
    @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    player1_count = @cups[6].count
    player2_count = @cups[13].count

    if player1_count == player2_count
      :draw
    else
      player1_count > player2_count ? @name1 : @name2
    end
  end
end
