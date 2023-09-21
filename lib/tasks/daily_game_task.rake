namespace :daily_game do
    desc 'Genereates a daily game'
    task create_daily_game: :environment do 
        #Get array of all categories in the db
        categories = Question.select(:category).distinct 
        # ["sports", "geography", "first ladies"] #Add categories class method to question class to find all categories in db.
        #Create game with orig_date "D/M/Y"
        game = Game.create(orig_date: DateTime.now.strftime("%d/%m/%Y"))
        #Create 3 GameQuestions for each category
        categories.sample(3).each do |c|
            q_1 = Question.where("category = ? AND value = ?", "#{c[:category]}", "1").sample
            GameQuestion.create(game_id: game.id, question_id: q_1.id)

            q_2 = Question.where("category = ? AND value = ?", "#{c[:category]}", "2").sample
            GameQuestion.create(game_id: game.id, question_id: q_2.id)
            
            q_3 = Question.where("category = ? AND value = ?", "#{c[:category]}", "3").sample
            GameQuestion.create(game_id: game.id, question_id: q_3.id)
        end
        puts "Game Created!"
    end
end
