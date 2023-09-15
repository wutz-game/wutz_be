require 'rails_helper'

RSpec.describe Api::ChallengesController, type: :controller do
  describe 'GET #index' do
    it 'returns the last 9 game questions as JSON' do
      # Create a game
      game = FactoryBot.create(:game)

      # Create 9 game_question records associated with the same game
      game_questions = FactoryBot.create_list(:game_question, 9, game: game)

      # Make a GET request to the show action
      get :index

      # Validate the response
      expect(response).to have_http_status(:ok)
      parsed_response = JSON.parse(response.body)
      binding.pry
      expect(parsed_response.size).to eq(9) # Ensure 9 game questions were returned
      # Add more expectations based on your serialization format
    end
  end
end