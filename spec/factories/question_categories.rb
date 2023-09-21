FactoryBot.define do
  factory :question_category do
    name { Faker::Lorem.word}
    emoji { Faker::SlackEmoji.emoji}
    jservice_id { rand(1..100) }
  end
end