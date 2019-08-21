FactoryBot.define do
  factory :deck do
    name { "The Rock" }
    format { "Modern" }
    singleton_valid { true }
  end
end
