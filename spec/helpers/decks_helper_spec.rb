require 'rails_helper'

include ActionView::Helpers

RSpec.describe DecksHelper, type: :helper do
  let(:deck) { FactoryBot.create(:deck) }
  let(:card) { FactoryBot.create(:card) }

  before do
    deck.cards << card
    @deck = deck
  end

  describe '#average_cmc_calculator' do
    it 'calculates the average cmc of the deck' do
      card2 = Card.create(name: 'swamp', card_type: 'basic land', purpose: 'mana')
      card3 = Card.create(name: 'mountain', card_type: 'land', purpose: 'mana')
      card4 = Card.create(name: 'Bitterblossom', card_type: 'enchantment', purpose: 'creature', colorless: 1, black: 1, cmc: 2)
      @deck.cards << card2
      @deck.cards << card3
      @deck.cards << card4
      expect(average_cmc_calculator).to eq(2.5)
    end
  end

  describe '#deck_length' do
    it 'returns the number of cards' do
      expect(deck_length).to eq(1)
    end
  end

  describe '#creature_count' do
    it 'returns the number of creature cards' do
      expect(creature_count).to eq(1)
    end

    it 'calculates both legendary and non-legendary creatures' do
      card2 = Card.create(name: 'Massacre Girl', card_type: 'legendary creature')
      card3 = Card.create(name: 'mountain', card_type: 'land', purpose: 'mana')
      card4 = Card.create(name: 'endless cockroaches', card_type: 'creature', purpose: 'creature', colorless: 1, black: 1, cmc: 2)
      @deck.cards << card2
      @deck.cards << card3
      @deck.cards << card4
      expect(creature_count).to eq(3)
    end
  end

  describe '#spot_removal' do
    it 'returns the number of spot removal cards' do
      card.purpose = 'removal'
      card.save
      expect(spot_removal).to eq(1)
    end
  end

  describe '#board_wipes' do
    it 'returns the number of board wipe cards' do
      card.purpose = 'board wipe'
      card.save
      expect(board_wipes).to eq(1)
    end
  end

  describe '#mana_ramp' do
    it 'returns the number of mana ramp cards' do
      card.purpose = 'mana ramp'
      card.save
      expect(mana_ramp).to eq(1)
    end
  end

  describe '#card_draw' do
    it 'returns the number of card draw cards' do
      card.purpose = 'card draw'
      card.save
      expect(card_draw).to eq(1)
    end
  end

  describe '#nonland_permanents' do
    it 'returns the deck minus the land card names' do
      card2 = Card.create(name: 'swamp', card_type: 'basic land', purpose: 'mana')
      card3 = Card.create(name: 'Cabal Coffer', card_type: 'land', purpose: 'mana')
      card4 = Card.create(name: 'Bitterblossom', card_type: 'enchantment', purpose: 'creature')
      @deck.cards << card2
      @deck.cards << card3
      @deck.cards << card4
      expect(@deck.cards.length).to eq(4)
      expect(nonland_permanents.length).to eq(2)
    end
  end

  describe '#land_cards' do
    it 'returns only land cards' do
      card2 = Card.create(name: 'swamp', card_type: 'basic land', purpose: 'mana')
      card3 = Card.create(name: 'mountain', card_type: 'basic land', purpose: 'mana')
      card4 = Card.create(name: 'Urborg Tomb of Yawgmoth', card_type: 'land', purpose: 'mana')
      card5 = Card.create(name: 'Cabal Coffers', card_type: 'land', purpose: 'mana')
      @deck.cards << card2
      @deck.cards << card3
      @deck.cards << card4
      @deck.cards << card5
      expect(@deck.cards.length).to eq(5)
      expect(land_cards.length).to eq(4)
    end

    describe '#basic_lands' do
      it 'filters out duplicate basic lands in list' do
        @deck.cards << Card.create(name: 'swamp', card_type: 'basic land', purpose: 'mana')
        @deck.cards << Card.create(name: 'mountain', card_type: 'basic land', purpose: 'mana')
        @deck.cards << Card.create(name: 'mountain', card_type: 'basic land', purpose: 'mana')
        @deck.cards << Card.create(name: 'island', card_type: 'basic land', purpose: 'mana')
        @deck.cards << Card.create(name: 'swamp', card_type: 'basic land', purpose: 'mana')
        lands = basic_lands.map { |card| card }
        expect(lands).to eq(['swamp', 'mountain', 'island'])
      end
    end

    it 'keeps a list of total basic lands for each type' do
      # spec here
    end
  end
end
