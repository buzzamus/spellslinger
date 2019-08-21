class Card < ApplicationRecord
  validates :name, presence: true, length: { in: 2..80 }
  validates :type, presence: true, length: { in: 4..40 }
  validates :purpose, length: { in: 3..40 }, allow_blank: true
end
