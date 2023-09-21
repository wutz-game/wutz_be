require 'rails_helper'

RSpec.describe GameQuestionCategory, type: :model do
  describe 'relations' do
    it { should belong_to(:game) }
    it { should belong_to(:question_category) }
  end
end
