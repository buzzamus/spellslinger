require 'rails_helper'

RSpec.describe Deck, type: :model do
  let(:deck) { FactoryBot.create(:deck) }

  it 'has a valid factory' do
    expect(deck).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
