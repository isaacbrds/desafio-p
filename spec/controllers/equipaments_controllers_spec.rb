require 'rails_helper'

RSpec.describe EquipamentsController, type: :controller do

  describe 'GET #index' do
    before do
      get :index
    end
    it { is_expected.to respond_with(:success) }
  end

  describe 'GET #show' do
    let(:equipament) { create(:equipament) }
    before do
      get :show, params: { id: equipament.id }
    end
    it { is_expected.to respond_with(:success) }
  end

  describe 'GET #edit' do
    let(:equipament) { create(:equipament) }
    before do
      get :edit, params: { id: equipament.id }
    end
    it { is_expected.to respond_with(:success) }
  end

  describe 'GET #new' do
    before do
      get :new
    end
    it { is_expected.to respond_with(:success) }
  end

  describe 'POST #create' do
    let(:equipament_params) {  attributes_for(:equipament)  }
    it "add a new equipament" do
      expect {
        post :create, params: equipament_params
      }.to change(Equipament, :count).by(1)
    end
  end

  describe 'DELETE #destroy' do
    let! ( :equipament ) { create(:equipament) }
    it "delete a new equipament" do

      expect {
        delete :destroy , params: { id: equipament.id }
      }.to change(Equipament, :count).by(-1)
    end
  end

  describe 'PATCH #update' do
    let(:equipament) { create(:equipament) }
    let(:equipament_params) {  attributes_for(:equipament, name: "new name")  }
    it "update a equipament" do
      patch :update, params: {  id: equipament.id, equipament: equipament_params }
      equipament.reload
      expect(equipament.name).to eq(equipament_params[:name])
    end
  end
end