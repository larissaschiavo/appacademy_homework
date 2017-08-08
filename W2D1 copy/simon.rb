class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @sequence_length = 1
    @game_over = false
  end

  def play

    until @game_over == true
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence

    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

# The goal of require_sequence is to prompt the user to repeat
# back the new sequence that was just shown to them
  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 0.75
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    puts "Repeat the sequence by entering the first letter of each color on a new line"
    @seq.each do |color|
      user_col = gets.chomp
        if color[0] != user_col
          @game_over = true
          break
        end
      end
    sleep 0.25
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    p "You won this round, here's the next sequence:"
  end

  def game_over_message
    p "game over"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
