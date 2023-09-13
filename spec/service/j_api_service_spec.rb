require 'rails_helper'

RSpec.describe JApiSerice, type: :service do
    describe '#instance methods' do
        describe 'get_clue(category, point_value)' do
            response = JApiSerice.new.get_clue("american history", "$100")
            binding.pry
            clues = JSON.parse(response.body)
        end
    end
end