require 'rails_helper'

describe Customer, type: :request do
  describe 'GET /index' do
    let!(:customers) { create_list(:customer, 5, :with_package) }
    before { get customers_path }

    it { is_expected.to render_template(:index) }
    it { expect(response).to be_successful }
    it 'Populate an array of customers' do
      expect(assigns(:customers)).to match_array customers
    end
  end

  describe 'GET /new' do
    before { get new_customer_path }

    it { is_expected.to render_template(:new) }
    it { expect(response).to be_successful }
    it 'Create a new customer' do
      expect(assigns(:customer)).to be_a(Customer)
    end
  end

  describe 'GET /edit' do
    let!(:customer) { create(:customer, :with_package) }
    before { get edit_customer_path(customer) }

    it { is_expected.to render_template(:edit) }
    it { expect(response).to be_successful }
    it 'Initialize with returned customer' do
      expect(assigns(:customer)).to be_a(Customer) & have_attributes(id: customer.id)
    end
  end

  describe 'GET /show' do
    let(:customer) { create(:customer, :with_package) }
    before { get customer_path(customer) }

    it { is_expected.to render_template(:show) }
    it { expect(response).to be_successful }
    it 'Initialize given customer' do
      expect(assigns(:customer)).to eq customer
    end
  end

  describe 'POST /create' do
    subject do
      post customers_path, params: {customer: customer_params}
    end

    context 'with valid params' do
      let(:package) { create(:package) }
      let(:customer_params) {
        {
          name: 'John',
          cpf: '11122233345',
          customers_package_attributes: {package_id: package.id}
        }
      }

      it { expect(subject).to redirect_to customer_path(assigns(:customer)) }
      it 'Verify saved customer' do
        expect { subject }.to change(Customer, :count).by(1)
        expect(assigns(:customer)).to have_attributes(name: 'John', cpf: '11122233345')
      end
      it "should return new year bill for customer" do
        expect { subject }.to change(YearBill, :count).by(1)
        expect(assigns(:customer).year_bills).to contain_exactly(
          an_instance_of(YearBill) & have_attributes(total_sum: 660.0)
        )
      end
    end

    context 'with invalid params' do
      let(:package) { create(:package) }
      let(:customer_params) {
        {
          name: '',
          cpf: '11122233345',
          customers_package_attributes: {package_id: package.id}
        }
      }

      it { expect(subject).to render_template(:new) }
    end
  end

  describe 'PUT /create' do
    let(:customer) { create(:customer, :with_package) }
    subject do
      put customer_path(customer), params: {customer: customer_params}
    end

    context 'with valid params' do
      let(:package) { create(:package) }
      let(:customer_params) {
        {
          name: 'John',
          cpf: '11122233346',
          customers_package_attributes: {package_id: package.id}
        }
      }

      it { expect(subject).to redirect_to customer_path(assigns(:customer)) }
      it 'Verify updated customer' do
        expect { subject }.to change(Customer, :count).by(1)
        expect(assigns(:customer)).to have_attributes(name: 'John', cpf: '11122233346')
      end
      it "should not return new year bill for customer" do
        expect { subject }.to change(YearBill, :count).by(0)
      end
    end

    context 'with invalid params' do
      let(:package) { create(:package) }
      let(:customer_params) {
        {
            name: '',
            cpf: '11122233345',
            customers_package_attributes: {package_id: package.id}
        }
      }

      it { expect(subject).to render_template(:edit) }
    end
  end

  describe 'DELETE /destroy' do
    let!(:customer) { create(:customer, :with_package_and_additional_services) }
    subject { delete customer_path(customer) }

    it { expect { subject }.to change(Customer, :count).by(-1) }
    it { expect(subject).to redirect_to customers_path }
  end
end
