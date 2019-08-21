require 'rails_helper'

RSpec.describe Deck, type: :model do
  let(:deck) { FactoryBot.create(:deck) }

  it 'has a valid factory' do
    expect(deck).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:singleton_valid) }
    it { should validate_length_of(:name).is_at_most(70) }
    it { should validate_presence_of(:format) }
    it { should validate_length_of(:format).is_at_least(3) }
    it { should validate_length_of(:format).is_at_most(40) }
  end
end
