require 'csv'

class Card < ApplicationRecord
  validates :name, presence: true, length: { in: 2..80 }
  validates :card_type, presence: true, length: { in: 4..40 }
  validates :purpose, length: { in: 3..40 }, allow_blank: true

  belongs_to :deck

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |line|
      @card = Card.where(name: line['name']).first_or_create(
        name: line['name'],
        card_type: line['type'],
        purpose: line['purpose'],
        cmc: (line['colorless'].to_i + line['blue'].to_i + line['black'].to_i + line['green'].to_i + line['red'].to_i + line['white'].to_i),
        blue: line['blue'].to_i,
        black: line['black'].to_i,
        red: line['red'].to_i,
        green: line['green'].to_i,
        white: line['white'].to_i,
        colorless: line['cmc'].to_i - (line['green'].to_i + line['blue'].to_i + line['black'].to_i + line['red'].to_i + line['white'].to_i),
        deck_id: line['deck_id'].to_i
      )
    end
  end
end
