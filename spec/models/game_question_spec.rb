require 'rails_helper'

RSpec.describe GameQuestion, type: :model do
    describe 'relations' do
        it { should belong_to(:game) }
        it { should belong_to(:question) }
    end

    describe 'validations' do
        it { should validate_presence_of(:game_id) }
        it { should validate_presence_of(:question_id) }
    end
end