namespace :daily_game do
  desc 'Genereates a daily game'
  task create_new_daily_game: :environment do 
    jservice = JApiService.new
    game = Game.create(orig_date: DateTime.now.strftime("%d/%m/%Y"))

    category_counter = 0
    question_categories = []
    modern_clues = jservice.modern_clues

    # Fetch the first three clues from the jservice.io clues endpoint that have more than 5 clues
    jservice.modern_clues.each do |clue|
      if category_counter == 3
        break
      elsif clue[:category][:clues_count] < 5
        return
      else
        category_counter += 1
        question_categories << {
          jservice_id: clue[:category][:id],
          name: clue[:category][:title]
        }
      end
    end

    # Use ChatGPT to get Emojis for each category
    question_categories.each do |question_category|
      emoji = ChatgippityService.new(question_category[:name]).get_url

      question_category[:emoji] = emoji.grapheme_clusters.first
      # Note: I use the "grapheme_clusters" method to only get the first emoji in the event that multiple are sent over
    end
    
    # Create an array of 3 QuestionCategory objects
    question_categories = question_categories.map do |qc_data|
      question_category = QuestionCategory.new(qc_data)

      if question_category.save
        question_category
      else
        QuestionCategory.where(jservice_id: qc_data[:jservice_id]).first
      end
    end
    puts "Categories created"

    game.question_categories << question_categories

    # CREATE QUESTIONS FROM EACH CATEGORY
    # Each category, hit the Jservice API for clues of that category, sorted by date
    # Then, pick and create three questions for that category with appropriate point values
    # Create game_questions for each question
    question_categories.each do |qc|
      category_qs = jservice.clues_by_category(qc.jservice_id)

      # Takes the three questions with the lowest point value
      easiest_qs = category_qs.min_by(3) { |q| q[:value] }

      one_pt_q = Question.create(
        answer: easiest_qs[0][:answer],
        clue: easiest_qs[0][:question],
        clue_id: easiest_qs[0][:id],
        category: easiest_qs[0][:category][:title],
        category_id: easiest_qs[0][:category_id],
        value: 1
      )
      two_pt_q = Question.create(
        answer: easiest_qs[1][:answer],
        clue: easiest_qs[1][:question],
        clue_id: easiest_qs[1][:id],
        category: easiest_qs[1][:category][:title],
        category_id: easiest_qs[1][:category_id],
        value: 2
      )
      three_pt_q = Question.create(
        answer: easiest_qs[2][:answer],
        clue: easiest_qs[2][:question],
        clue_id: easiest_qs[2][:id],
        category: easiest_qs[2][:category][:title],
        category_id: easiest_qs[2][:category_id],
        value: 3
      )
    end
    
    puts "Game Created!"
  end
end
