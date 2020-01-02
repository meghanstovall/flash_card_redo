require 'colorize'

class Game

  attr_reader :round

  def initialize(round)
    @round = round
  end

  def start
    puts "Welcome! You're playing with #{@round.total_num_cards} cards.".magenta
    puts "-------------------------------------------------".magenta
    questions
  end

  def questions
    until @round.deck.cards.length == 0
      puts "This is card number #{@round.turns.count + 1} out of #{@round.total_num_cards}.".cyan
      puts "Question: #{@round.current_card.question}".cyan

      user_guess = gets.chomp
      turn = @round.take_turn(user_guess)
      puts "#{turn.feedback}"
    end
    results
  end

  def results
    puts "****** Game over! ******".magenta
    puts "You had #{@round.number_correct} out of #{@round.total_num_cards} for a total score of #{@round.percent_correct.round(2)}".green

    category_percentage_hash.each do |pair|
      puts "#{pair.first.to_s} - #{pair.last}% correct".cyan
    end
  end

  def category_percentage_hash
    @round.completed_cards.reduce({}) do |hash, card|
      hash[card.category] = @round.percent_correct_by_category(card.category).round(2)
      hash
    end
  end
end
