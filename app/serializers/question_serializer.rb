class QuestionSerializer 
    
    def self.format_question(question)
        {
            answer: question[:answer],
            clue: question[:question],
            clue_id: question[:id],
            category: question[:category][:title],
            category_id: question[:category_id],
            value: adjusted_value(question[:value])
        }
    end
    
    def self.adjusted_value(value)
        if value.nil?
            nil
        elsif value < 300
            1
        elsif value > 500
            3
        else
            2
        end
    end
end