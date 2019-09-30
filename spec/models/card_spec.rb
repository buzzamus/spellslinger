require 'rails_helper'

RSpec.describe Card, type: :model do
  let(:card) { FactoryBot.create(:card) }

  it 'has a valid factory' do
    expect(card).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2) }
    it { should validate_length_of(:name).is_at_most(80) }
    it { should validate_presence_of(:card_type) }
    it { should validate_length_of(:card_type).is_at_least(4) }
    it { should validate_length_of(:card_type).is_at_most(40) }
    it { should allow_value('', nil).for(:purpose) }
    it { should validate_length_of(:purpose).is_at_least(3) }
    it { should validate_length_of(:purpose).is_at_most(40) }

    it 'downcases card type if capitalized' do
      card.card_type = 'Legendary Creature'
      card.save
      expect(card.card_type).to eq('legendary creature')
    end
  end
end
