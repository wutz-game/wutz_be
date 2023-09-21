class Api::UserGamesController < ApplicationController

  def create
    user_game = UserGame.create!(user_game_params)

    # Create new user_answers objects
    # I don't know the proper way to do this. Would I post to a user_answers_controller?
    permitted_user_answers_params.each do |user_answer_params|
      user_game.user_answers.create!(user_answer_params)
    end

    # Send a successful HTTP 201 creation response
    render json: UserGameSerializer.new(user_game), status: 201
  end

  private

  # Returns the user_game params
  def user_game_params
    params.require(:user_game).require(:data).permit(:user_id, :game_id, :score)
  end

  # Returns the 9 user_answers as an array
  def user_answers_params
    params.require(:user_game).require(:data).require(:user_answers)
  end

  # Returns each user_answer as permitted params 
  def permitted_user_answers_params
    user_answers_params.map do |answer_params|
      answer_params.permit(:game_question_id, :user_answer, :result)
    end
  end
end