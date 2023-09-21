require 'rails_helper'

RSpec.describe JApiService, type: :service do
    describe '#instance methods', :vcr do
        before do
            @j_api_service = JApiService.new
        end
        describe 'clues_by_category(category_id)' do
            it 'returns all clues for a given category_id' do
                clue_category = { id: 67, name: "first ladies" }
                
                clues = @j_api_service.clues_by_category(clue_category[:id])
                
                clue = clues[0]
                
                expect(clue).to have_key(:id)
                expect(clue[:id]).to be_an(Integer)

                expect(clue).to have_key(:category_id)
                expect(clue[:category_id]).to eq(clue_category[:id])
                
                expect(clue).to have_key(:category)
                expect(clue[:category]).to be_a(Hash)
                
                expect(clue[:category]).to have_key(:title)
                expect(clue[:category][:title]).to eq(clue_category[:name])
                
                expect(clue).to have_key(:value)
                expect(clue[:value]).to be_an(Integer)
                
                expect(clue).to have_key(:answer)
                expect(clue[:answer]).to be_a(String)
                
                expect(clue).to have_key(:question)
                expect(clue[:question]).to be_a(String)
                
                expect(clue).to have_key(:airdate)
            end
        end

        describe 'three_random_clues' do
            it "returns three random clues" do
                random_clues = @j_api_service.three_random_clues

                expect(random_clues).to be_an(Array)
                expect(random_clues.length).to eq(3)

                random_clue = random_clues[0]

                expect(random_clue).to have_key(:id)
                expect(random_clue[:id]).to be_an(Integer)

                expect(random_clue).to have_key(:category_id)
                expect(random_clue[:category_id]).to be_an(Integer)
                
                expect(random_clue).to have_key(:category)
                expect(random_clue[:category]).to be_a(Hash)
                
                expect(random_clue[:category]).to have_key(:title)
                expect(random_clue[:category][:title]).to be_a(String)
                
                expect(random_clue[:category]).to have_key(:clues_count)
                expect(random_clue[:category][:clues_count]).to be_an(Integer)
                
                expect(random_clue).to have_key(:value)
                expect(random_clue[:value]).to be_an(Integer)
                
                expect(random_clue).to have_key(:answer)
                expect(random_clue[:answer]).to be_a(String)
                
                expect(random_clue).to have_key(:question)
                expect(random_clue[:question]).to be_a(String)
                
                expect(random_clue).to have_key(:airdate)
            end
        end
    end
end
