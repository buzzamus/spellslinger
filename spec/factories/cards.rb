FactoryBot.define do
  factory :card do
    name { "Yehenni, Undying Partisan" }
    type { "Legendary Creature" }
    purpose { "Commander" }
    cmc { 3 }
    blue { 0 }
    red { 0 }
    black { 1 }
    green { 0 }
    white { 0 }
    colorless { 2 }
  end
end
