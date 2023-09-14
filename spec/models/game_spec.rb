require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:orig_date) }
  end

  describe 'associations' do
    it { should have_many(:questions) }
  end
end
