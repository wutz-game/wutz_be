class Api::ChallengesController < ApplicationController
  def index
    # Fetch the last 9 game questions ordered by created_at
    game_questions = GameQuestion.includes(:question).order(created_at: :desc).limit(9)

    # Order the game questions by category and value 
    ordered_questions = game_questions.sort_by { |gq| [gq.question.category, gq.question.value] }

    # Send the serialized data as JSON response
    render json: GameSerializer.serialize(ordered_questions)
  end
end