require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require './lib/card'

class CardGeneratorTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the name of the professional basketball team in Denver?", "Denver Nuggets", :Sports)
    @card_2 = Card.new("What is the name of the professional football team in Denver?", "Denver Broncos", :Sports)
    @card_3 = Card.new("What does MLB stand for?", "Major League Baseball", :Sports)
    @card_4 = Card.new("What holiday is on December 25th?", "Christmas", :Holidays)
    @card_5 = Card.new("What holiday is it when there is a big turkey dinner?", "Thanksgiving", :Holidays)
    @card_6 = Card.new("What does NYE stand for?", "New Years Eve", :Holidays)
    @card_7 = Card.new("How many grades are in the standard US high school?", "Four", :Education)
    @card_8 = Card.new("How many grades are in the standard US middle school?", "Three", :Education)
    @card_9 = Card.new("What type of degree do you receive after graduating from a 4-year college?", "Bachelor's Degree", :Education)

    @filename = "cards.txt"
    @cards = CardGenerator.new(@filename)
  end

  def test_can_get_all_cards
    @filename = "cards.txt"
    @cards = CardGenerator.new(@filename)

    assert_instance_of Card, @cards.cards.first
    assert_instance_of Card, @cards.cards[1]
    assert_instance_of Card, @cards.cards.last
  end
end
