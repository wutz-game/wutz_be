require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:orig_date) }
  end

  describe 'associations' do
    it { should have_many(:game_questions) }
    it { should have_many(:questions).through(:game_questions) }
    it { should have_many(:user_games) }
    it { should have_many(:user_answers).through(:user_games) }
  end
end
