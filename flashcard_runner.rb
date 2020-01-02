require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/game'

card_1 = Card.new("What is the name of the proffesional basketball team in Denver?", "Denver Nuggets", :Sports)
card_2 = Card.new("What is the name of the proffesional football team in Denver?", "Denver Broncos", :Sports)
card_3 = Card.new("What does MLB stand for?", "Major League Baseball", :Sports)
card_4 = Card.new("What holiday is on December 25th?", "Christmas", :Holidays)
card_5 = Card.new("What holiday is it when there is a big turkey dinner?", "Thanksgiving", :Holidays)
card_6 = Card.new("What does NYE stand for?", "New Years Eve", :Holidays)
card_7 = Card.new("How many grades are in the standard US high school?", "Four", :Education)
card_8 = Card.new("How many grades are in the standard US middle school?", "Three", :Education)
card_9 = Card.new("What type of degree do you receive after graduating from a 4-year college", "Bachelor's Degree", :Education)

deck = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8, card_9])

round = Round.new(deck)
game = Game.new(round)
game.start
