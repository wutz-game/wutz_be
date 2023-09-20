require 'rails_helper'

RSpec.describe UserAnswer, type: :model do
  describe 'relations and validations' do
    it { should validate_presence_of(:user_game_id) }
    it { should validate_presence_of(:game_question_id) }
    it { should validate_presence_of(:result) }

    it { should belong_to(:user_game)}
  end
end
