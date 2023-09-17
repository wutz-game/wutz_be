require 'rails_helper'

RSpec.describe Api::ChallengesController, type: :controller do
  describe 'GET #index' do
    it 'returns the last 9 game questions as JSON' do
      game = FactoryBot.create(:game)
      game_questions = FactoryBot.create_list(:game_question, 9, game: game)

      get :index

      expect(response).to have_http_status(:ok)
      parsed_response = JSON.parse(response.body)

      # Ensure there are 3 categories
      expect(parsed_response["data"]["categories"].count).to eq(3)

      # Ensure there are 9 questions in total
      total_questions = parsed_response["data"]["categories"].sum { |category| category["questions"].count }
      expect(total_questions).to eq(9)
      # Add more expectations based on our serialization format
    end
  end
end