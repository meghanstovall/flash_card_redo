require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_has_attributes
    assert_equal [@card_1, @card_2, @card_3], @deck.cards
  end

  def test_length_of_deck
    assert_equal 3, @deck.count
  end

  def test_find_cards_by_category
    assert_equal [@card_1], @deck.cards_in_category(:Geography)
    assert_equal [@card_2, @card_3], @deck.cards_in_category(:STEM)
    assert_equal [], @deck.cards_in_category("Pop Culture")
  end
end
