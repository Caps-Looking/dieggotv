require 'rails_helper'

RSpec.describe PackageDecorator do
  subject(:decorator) { package.decorate }
  let(:package) { create(:package) }

  describe '#description' do
    it 'gets package description' do
      expect(decorator.description).to eq("#{package.name} - $#{package.price}")
    end
  end
end
