FactoryBot.define do
  factory :question do
    clue { "Hello" }
    answer { "Hi" }
    category { ["IS", "THIS", "WORKING?"].sample }
    value { rand(1..3) }
    category_id { rand(42..69) }
    clue_id { 420 }
  end
end
