module DecksHelper
  def average_cmc_calculator
    average_cmc = 0
    nonland_cards = @deck.cards.reject { |card| card.purpose == 'mana' }
    nonland_cards.map { |card| average_cmc += card.cmc }
    average_cmc = (average_cmc.to_f / nonland_cards.length.to_f)
  end

  def deck_length
    @deck.cards.length
  end

  def creature_count
    creatures = @deck.cards.where(card_type: 'creature').length
    creatures + @deck.cards.where(card_type: 'legendary creature').length
  end

  def spot_removal
    @deck.cards.where(purpose: 'removal').length
  end

  def board_wipes
    @deck.cards.where(purpose: 'board wipe').length
  end

  def mana_ramp
    @deck.cards.where(purpose: 'mana ramp').length
  end

  def card_draw
    @deck.cards.where(purpose: 'card draw').length
  end

  def nonland_permanents
    @deck.cards.where.not(purpose: 'mana')
  end

  def land_cards
    @deck.cards.where(purpose: 'mana')
  end

  def basic_lands
    @deck.cards.where(card_type: 'basic land').map(&:name).uniq
  end

  def non_basic_lands
    land_cards.where.not(card_type: 'basic land')
  end
end
