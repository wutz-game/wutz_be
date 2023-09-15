class GameSerializer
  def self.serialize(game_data)
    game = game_data.first.game

    categories = game_data.map { |game_question| game_question.question.category }.uniq
    
    {
      data: {
        type: "game",
        id: game.id,
        date: game.orig_date,
        categories: serialize_categories(categories, game_data)
      }
    }
  end

  def self.serialize_categories(categories, game_data)
    categories.map do |category|
      {
        category: category,
        category_emoji: CATEGORY_EMOJI_MAP[category], #ummm something about chatgippity here
        questions: serialize_questions(category, game_data)
      }
    end
  end

  def self.serialize_questions(category, game_data)
    game_questions = game_data.select { |game_question| game_question.question.category == category }

    game_questions.map do |game_question|
      question = game_question.question
      {
        answer: question.answer,
        question: question.clue,
        points: question.value
      }
    end
  end

  CATEGORY_EMOJI_MAP = {
    "IS" => "😀",
    "THIS" => "😎",
    "WORKING" => "🔧",
    "First Ladies" => "👩",
    "Geography" => "🌎",
    "Sports" => "🏈",
  }
  
end
