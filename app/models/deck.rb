require 'csv'
require 'activerecord-import/base'

class Deck < ApplicationRecord
  validates :name, presence: true, length: { in: 1..70 }
  validates :format, presence: true, length: { in: 3..40 }
  validates :singleton_valid, presence: true

  has_many :cards
end
