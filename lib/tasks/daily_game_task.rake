namespace :daily_game do
    desc 'Genereates a daily game'
    task create_daily_game: :environment do 
        categories = ["sports", "geography", "first ladies"] #Add categories class method to question class to find all categories in db.
        game = Game.create!(orig_date: DateTime.now.strftime("%d/%m/%Y"))
        categories.each do |c|
            q_1 = Question.where("category = ? AND value = ?", "#{c}", "1").sample
            GameQuestion.create!(game_id: game.id, question_id: q_1.id)
            q_2 = Question.where("category = ? AND value = ?", "#{c}", "2").sample
            GameQuestion.create!(game_id: game.id, question_id: q_2.id)
            q_3 = Question.where("category = ? AND value = ?", "#{c}", "3").sample
            GameQuestion.create!(game_id: game.id, question_id: q_3.id)
        end
        puts "Game Created!"
    end
end
