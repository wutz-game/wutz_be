FactoryBot.define do
  factory :question do
    clue { "WTF" }
    answer { "White Bread" }
    category { ["IS", "THIS", "WORKING?"].sample  }
    value { rand(1..3) }
    category_id { rand(42..69) }
    clue_id { 42 }
  end
end
