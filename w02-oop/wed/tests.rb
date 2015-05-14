require 'minitest/autorun'

require './cards'

class CardTest < MiniTest::Test
  Card = IronYardGames::Card

  def test_can_create_a_card
    card = Card.new
    assert_instance_of Card, card
  end

  def test_can_create_specific_card
    card = Card.new(2, :hearts)
    assert_instance_of Card, card
  end

  def test_cards_have_rank_and_suit
    card = Card.new(2, :hearts)
    assert_equal card.suit, :hearts
    assert_equal card.rank, 2
  end

  def test_cards_can_be_compared
    skip "test this later"
  end
end
