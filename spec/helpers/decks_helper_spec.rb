require 'rails_helper'

include ActionView::Helpers

RSpec.describe DecksHelper, type: :helper do
  let(:deck) { FactoryBot.create(:deck) }
  let(:card) { FactoryBot.create(:card) }

  describe "#deck_length" do
    it 'returns the number of cards' do
      deck.cards << card
      @deck = deck
      expect(deck_length).to eq(1)
    end
  end

  describe '#creature_count' do
    it 'returns the number of creature cards' do
      deck.cards << card
      @deck = deck
      expect(creature_count).to eq(1)
    end
  end
end
