require './lib/turn'

class Round

  attr_reader :deck, :turns, :completed_cards

  def initialize(deck)
    @deck = deck
    @turns = []
    @completed_cards = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @completed_cards << @deck.cards.shift
    turn
  end

  def number_correct
    num_correct = @turns.find_all {|turn| turn.correct?}
    num_correct.length
  end

  def number_correct_by_category(category)
    num_correct = @turns.find_all {|turn| turn.card.category == category && turn.correct?}
    num_correct.length
  end

  def percent_correct
    (number_correct / @turns.length.to_f) * 100
  end

  def percent_correct_by_category(category)
    num_in_cat = @completed_cards.find_all {|card| card.category == category}

    (number_correct_by_category(category) / num_in_cat.length.to_f) * 100
  end

  def total_num_cards
    if @completed_cards.empty?
      @deck.cards.length
    elsif @deck.cards.empty?
      @completed_cards.length
    else
      @deck.cards.length + @completed_cards.length
    end
  end
end
