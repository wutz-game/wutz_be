class QuestionSerializer 
    def self.format_question(question)
            {
                answer: question[:answer],
                clue: question[:question],
                clue_id: question[:id],
                game_id: nil,
                category: question[:category][:title],
                category_id: question[:category_id],
                value: question[:value]
            }
    end
end