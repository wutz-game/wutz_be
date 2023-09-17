require 'rails_helper'

RSpec.describe ChatgippityService, type: :service do
  describe '#generate_response' do
    it 'generates a response', :vcr do
      response = ChatgippityService.new("Dancing").get_url

      expect(response).to be_a(String)
      expect(response).to eq("💃")
    end
  end
end