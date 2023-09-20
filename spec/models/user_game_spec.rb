require 'rails_helper'

RSpec.describe UserGame, type: :model do
  describe 'relations and validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:game_id) }
    
    it { should have_many(:user_answers) }
    it { should belong_to(:game) }
  end
end
