require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
    @turn_2 = Turn.new("Alaska", @card)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_attributes
    assert_equal "Juneau", @turn.guess
    assert_equal @card, @turn.card
  end

  def test_if_correct_guess
    assert @turn.correct?
    refute @turn_2.correct?
  end

  def test_gives_feedback
    assert_equal "Correct!", @turn.feedback
    assert_equal "Incorrect.", @turn_2.feedback
  end
end
