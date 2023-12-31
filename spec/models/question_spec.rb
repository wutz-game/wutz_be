require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:clue) }
    it { should validate_presence_of(:answer) }
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:clue_id) }
    it { should validate_presence_of(:value) }
    it { should validate_presence_of(:category_id) }
  end

  describe 'associations' do
    it { should have_many(:game_questions) }
    it { should have_many(:games).through(:game_questions) }
  end
end
