require 'rails_helper'

include ActionView::Helpers

RSpec.describe DecksHelper, type: :helper do
  let(:deck) { FactoryBot.create(:deck) }
  let(:card) { FactoryBot.create(:card) }

  before do
    deck.cards << card
    @deck = deck
  end

  describe "#deck_length" do
    it 'returns the number of cards' do
      expect(deck_length).to eq(1)
    end
  end

  describe '#creature_count' do
    it 'returns the number of creature cards' do
      expect(creature_count).to eq(1)
    end
  end

  describe '#spot_removal' do
    it 'returns the number of spot removal cards' do
      card.purpose = "removal"
      card.save
      expect(spot_removal).to eq(1)
    end
  end

  describe '#board_wipes' do
    it 'returns the number of board wipe cards' do
      card.purpose = "board wipe"
      card.save
      expect(board_wipes).to eq(1)
    end
  end

  describe '#mana_ramp' do
    it 'returns the number of mana ramp cards' do
      card.purpose = "mana ramp"
      card.save
      expect(mana_ramp).to eq(1)
    end
  end

  describe '#card_draw' do
    it 'returns the number of card draw cards' do
      card.purpose = "card draw"
      card.save
      expect(card_draw).to eq(1)
    end
  end
end
