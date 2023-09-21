require "rails_helper"

RSpec.describe QuestionCategory, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:emoji) }
    it { should validate_presence_of(:jservice_id) }
  end

  describe "associations" do
    it { should have_many(:game_question_categories) }
    it { should have_many(:game_questions).through(:game_question_categories) }
  end
end