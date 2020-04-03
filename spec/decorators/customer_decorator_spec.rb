require 'rails_helper'

RSpec.describe CustomerDecorator do
  subject(:decorator) { customer.decorate }
  let(:customer) { create(:customer, :with_package_and_additional_services) }

  describe '#cpf_masked' do
    it 'applies mask on cpf' do
      expect(decorator.cpf_masked).to eq(CPF.new(customer.cpf).formatted)
    end
  end
end
