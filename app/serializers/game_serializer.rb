class GameSerializer
  def self.serialize(game_data)
    {
      data: {
        type: "game",
        id: game_data[:id],
        date: game_data[:date],
        categories: game_data[:categories].map { |category| serialize_category(category) }
      }
    }
  end

  def self.serialize_category(category)
    {
      category: category[:category],
      category_emoji: category[:category_emoji],
      questions: category[:questions].map { |question| serialize_question(question) }
    }
  end

  def self.serialize_question(question)
    {
      answer: question[:answer],
      question: question[:question],
      points: question[:points]
    }
  end
end
