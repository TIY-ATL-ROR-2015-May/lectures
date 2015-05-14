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
    ace_of_spades = Card.new(:A, :spades)
    queen_of_hearts = Card.new(:Q, :hearts)
    two_of_diamonds = Card.new(2, :diamonds)
    assert ace_of_spades != queen_of_hearts
    assert ace_of_spades > queen_of_hearts
    refute ace_of_spades < two_of_diamonds
    refute two_of_diamonds > ace_of_spades
    assert_equal ace_of_spades, ace_of_spades
  end
end

class DeckTest < MiniTest::Test
  Card = IronYardGames::Card
  Deck = IronYardGames::Deck

  def test_can_make_a_deck
    deck = Deck.new
    assert_instance_of Deck, deck
  end

  def test_can_peek_at_top_card
    deck = Deck.new
    two_of_diamonds = Card.new(2, :diamonds)
    assert_equal deck.peek, two_of_diamonds
  end

  def test_deck_can_be_sorted
    skip
  end

  def test_deck_can_be_shuffled
    skip
  end

  def test_deck_has_a_card_count
    deck = Deck.new
    assert_equal deck.count, 52
    hand = deck.draw(7)
    assert_equal deck.count, 45
  end

  def test_deck_draws_from_the_top
    deck = Deck.new
    card_on_top = deck.peek
    hand = deck.draw(1)
    assert_equal hand[0], card_on_top
  end

  def test_can_draw_from_deck
    deck = Deck.new
    deck.shuffle!
    hand = deck.draw(5)
    hand.each do |card|
      assert_instance_of Card, card
    end
    assert_equal hand.length, 5
  end

end
