class CardGenerator

  def initialize(filename)
    @filename = filename
  end

  def cards
    cards = []
    File.readlines(@filename).each do |line|
      cards << line
    end

    cards_for_deck = []
    cards.each do |card|
      split_array = card.split(', ')
      category = split_array.last.gsub("\n", "").to_sym
      cards_for_deck << Card.new(split_array[0], split_array[1], category)
    end
    cards_for_deck
  end
end
