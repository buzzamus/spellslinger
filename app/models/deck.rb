class Deck < ApplicationRecord
  validates :name, presence: true, length: { in: 1..70 }
end
