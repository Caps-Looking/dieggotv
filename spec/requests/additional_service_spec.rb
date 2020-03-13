require 'rails_helper'

describe AdditionalService, type: :request do
  describe 'GET /index' do
    let!(:additional_services) { create_list(:additional_service, 5) }
    before { get additional_services_path }

    it { is_expected.to render_template(:index) }
    it { expect(response).to be_successful }
    it 'Populates an array of additional services' do
      expect(assigns(:additional_services)).to match_array additional_services
    end
  end

  describe 'GET /new' do
    before { get new_additional_service_path }

    it { is_expected.to render_template(:new) }
    it { expect(response).to be_successful }
    it 'Create a new additional service' do
      expect(assigns(:additional_service)).to be_a(AdditionalService)
    end
  end

  describe 'GET /edit' do
    let(:additional_service) { create(:additional_service) }
    before { get edit_additional_service_path(additional_service) }

    it { is_expected.to render_template(:edit) }
    it { expect(response).to be_successful }
    it 'Initialize with returned additional service' do
      expect(assigns(:additional_service)).to be_a(AdditionalService) & have_attributes(id: additional_service.id)
    end
  end

  describe 'GET /show' do
    let(:additional_service) { create(:additional_service) }
    before { get additional_service_path(additional_service) }

    it { is_expected.to render_template(:show) }
    it { expect(response).to be_successful }
    it 'Initialize given additional service' do
      expect(assigns(:additional_service)).to eq additional_service
    end
  end

  describe 'POST /create' do
    subject do
      post additional_services_path, params: { additional_service: additional_service_params }
    end

    context 'with valid params' do
      let(:additional_service_params) { { name: 'Basic', price: 55.0 } }

      it { expect(subject).to redirect_to additional_service_path(assigns(:additional_service)) }
      it 'Verify saved additional service' do
        expect { subject }.to change(AdditionalService, :count).by(1)
        expect(assigns(:additional_service)).to have_attributes(name: 'Basic', price: 55.0)
      end
    end

    context 'with invalid params' do
      let(:additional_service_params) { { name: '', price: 55.0 } }

      it { expect(subject).to render_template(:new) }
    end
  end

  describe 'PUT /update' do
    let(:additional_service) { create(:additional_service) }
    subject do
      put additional_service_path(additional_service), params: { additional_service: additional_service_params }
    end

    context 'with valid params' do
      let(:additional_service_params) { { name: 'Basic', price: 65.0 } }

      it { expect(subject).to redirect_to additional_service_path(assigns(:additional_service)) }
      it 'Verify updated additional service' do
        expect {
          subject
          additional_service.reload
        }.to change(additional_service, :price).to 65.0
      end
    end

    context 'with invalid params' do
      let(:additional_service_params) { { name: '', price: 65.0 } }

      it { expect(subject).to render_template(:edit) }
    end
  end

  describe 'DELETE /destroy' do
    let!(:additional_service) { create(:additional_service) }
    subject { delete additional_service_path(additional_service) }

    it { expect { subject }.to change(AdditionalService, :count).by(-1) }
    it { expect(subject).to redirect_to additional_services_path }
  end
end

