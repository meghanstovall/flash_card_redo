require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/game'
require './lib/card_generator'

create_cards = CardGenerator.new("cards.txt")

deck = Deck.new(create_cards.cards)

round = Round.new(deck)
game = Game.new(round)
game.start
