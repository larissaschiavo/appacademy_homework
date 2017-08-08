class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14){ Array.new }
    place_stones
  end



  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      next if idx == 6 || idx == 13
      4.times do
        cup << :stone
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos != (1..5) || start_pos != (7..12)
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    cup_idx = start_pos
    until stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13
      if cup_idx == 6
        cups[6] << stones.pop if current_player_name == @player1
      elsif cup_idx == 13
        cups[13] << stones.pop if current_player_name == @player2
      else
        cups[cup_idx] << stones.pop
      end
    end
  render
  next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
     ending_cup_idx
   end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[7..12].all? {|cup| cup.empty?} || @cups[1..5].all? {|cup| cup.empty?} else false
  end

  def winner
    # return :draw if @cups.all?{ |cup| cup.empty?}
    player1count = @cups[6].count
    player2count = @cups[13].count

    if player1count == player2count
      :draw
    else
      player1count > player2count ? @name1 : @name2
    end
  end
end
