module DecksHelper
  def average_cmc_calculator
    average_cmc = 0
    nonland_cards = @deck.cards.select { |card| card.card_type != 'land' }
    nonland_cards.map { |card| average_cmc += card.cmc }
    average_cmc = (average_cmc / nonland_cards.length).to_f
  end
end
