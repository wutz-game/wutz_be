FactoryBot.define do
  factory :question do
    answer { "Hi" }
    category { ["Category1", "category2", "category3"].sample }
    category_id { rand(42..69) }
    clue { "Hello" }
    clue_id { 420 }
    value { rand(1..3) }
  end
end
