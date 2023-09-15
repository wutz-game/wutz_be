class QuestionSerializer 
    def self.format_question(question)
            {
                answer: question[:answer],
                clue: question[:question],
                clue_id: question[:id],
                category: question[:category],
                category_id: question[:category_id],
                value: question[:value]
                
            }
    end
end