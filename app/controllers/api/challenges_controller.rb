module Api
  class ChallengesController < ApplicationController
    def index
      # Fetch the last 9 game questions ordered by created_at
      game_questions = GameQuestion.includes(:question).order(created_at: :desc).limit(9).to_a

      # Send the serialized data as JSON response
      render json: GameSerializer.serialize(game_questions)
    end
  end
end