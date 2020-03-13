require 'rails_helper'

describe Package, type: :request do
  describe 'GET /index' do
    let!(:packages) { create_list(:package, 5) }
    before { get packages_path }

    it { is_expected.to render_template(:index) }
    it { expect(response).to be_successful }
    it 'Populates an array of packages' do
      expect(assigns(:packages)).to match_array packages
    end
  end

  describe 'GET /new' do
    before { get new_package_path }

    it { is_expected.to render_template(:new) }
    it { expect(response).to be_successful }
    it 'Create a new package' do
      expect(assigns(:package)).to be_a(Package)
    end
  end

  describe 'GET /edit' do
    let(:package) { create(:package) }
    before { get edit_package_path(package) }

    it { is_expected.to render_template(:edit) }
    it { expect(response).to be_successful }
    it 'Initialize with returned package' do
      expect(assigns(:package)).to be_a(Package) & have_attributes(id: package.id)
    end
  end

  describe 'GET /show' do
    let(:package) { create(:package) }
    before { get package_path(package) }

    it { is_expected.to render_template(:show) }
    it { expect(response).to be_successful }
    it 'Initialize given package' do
      expect(assigns(:package)).to eq package
    end
  end

  describe 'POST /create' do
    subject do
      post packages_path, params: { package: package_params }
    end

    context 'with valid params' do
      let(:package_params) { { name: 'Basic', price: 55.0 } }

      it { expect(subject).to redirect_to package_path(assigns(:package)) }
      it 'Verify saved package' do
        expect { subject }.to change(Package, :count).by(1)
        expect(assigns(:package)).to have_attributes(name: 'Basic', price: 55.0)
      end
    end

    context 'with invalid params' do
      let(:package_params) { { name: '', price: 55.0 } }

      it { expect(subject).to render_template(:new) }
    end
  end

  describe 'PUT /update' do
    let(:package) { create(:package) }
    subject do
      put package_path(package), params: { package: package_params }
    end

    context 'with valid params' do
      let(:package_params) { { name: 'Basic', price: 65.0 } }

      it { expect(subject).to redirect_to package_path(assigns(:package)) }
      it 'Verify updated package' do
        expect {
          subject
          package.reload
        }.to change(package, :price).to 65.0
      end
    end

    context 'with invalid params' do
      let(:package_params) { { name: '', price: 65.0 } }

      it { expect(subject).to render_template(:edit) }
    end
  end

  describe 'DELETE /destroy' do
    let!(:package) { create(:package) }
    subject { delete package_path(package) }

    it { expect { subject }.to change(Package, :count).by(-1) }
    it { expect(subject).to redirect_to packages_path }
  end
end
