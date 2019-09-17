module DecksHelper
  def average_cmc_calculator
    average_cmc = 0
    nonland_cards = @deck.cards.select { |card| card.card_type != 'land' }
    nonland_cards.map { |card| average_cmc += card.cmc }
    average_cmc = (average_cmc / nonland_cards.length).to_f
  end

  def deck_length
    @deck.cards.length
  end

  def creature_count
    creatures = @deck.cards.where(card_type: "creature").length
    creatures += @deck.cards.where(card_type: "legendary creature").length
  end

  def spot_removal
    @deck.cards.where(purpose: "removal").length
  end

  def board_wipes
    @deck.cards.where(purpose: "board wipe").length
  end

  def mana_ramp
    @deck.cards.where(purpose: "mana ramp").length
  end

  def card_draw
    @deck.cards.where(purpose: "card draw").length
  end
end
