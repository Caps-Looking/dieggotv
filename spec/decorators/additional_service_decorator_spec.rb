require 'rails_helper'

RSpec.describe AdditionalServiceDecorator do
  subject(:decorator) { additional_service.decorate }
  let(:additional_service) { create(:additional_service) }

  describe '#description' do
    it 'gets additional service description' do
      expect(decorator.description).to eq("#{additional_service.name} - $#{additional_service.price}")
    end
  end
end
