require 'spec_helper'
require 'jwt'

module V1
  RSpec.describe PropertiesController, type: :controller do
    before do
      @user = create(:user)
      token = JWT.encode({ user_id: @user.id, exp: 15.minutes.from_now.to_i }, 's3cr3t')
      request.headers['Authorization'] = token
    end

    let(:valid_attributes) do
      {
        name: Faker::Name.name,
        description: Faker::Lorem.sentence,
        rental_price: 4000,
        status: 'published',
        tenant_name: Faker::Name.name,
        tenant_email: Faker::Internet.email,
        tenant_phone: Faker::PhoneNumber.phone_number,
        tenant_availability: [{ start_date: '2020-01-02T16:45:27+02:00', end_date: '2020-01-03T16:45:27+02:00' }]
      }
    end

    describe 'GET #index' do
      it 'assigns all properties as @propierties' do
        property = create(:property)
        get :index
        expect(assigns(:properties)).to eq([property])
      end

      it 'filter by status' do
        create(:property, status: 'published')
        property = create(:property, status: 'available')
        get :index, params: { status: 'available'}
        expect(assigns(:properties)).to eq([property])
      end

      it 'filter by rental price' do
        create(:property, rental_price: 5000)
        property = create(:property, rental_price: 2000)
        get :index, params: { rental_price: 3000}
        expect(assigns(:properties)).to eq([property])
      end
    end

    describe 'GET #show' do
      it 'assigns the requested property as @property' do
        property = create(:property)
        get :show, params: { id: property.to_param }
        expect(assigns(:property)).to eq(property)
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a Property' do
          expect do
            post :create, params: {property: valid_attributes}
          end.to change(Property, :count).by(1)
        end

        it 'assigns a newly created property as @property' do
          post :create, params: {property: valid_attributes}
          expect(assigns(:property)).to be_a(Property)
          expect(assigns(:property)).to be_persisted
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        let(:new_attributes) do
          {
            status: 'published'
          }
        end

        it 'updates the requested property' do
          property = create(:property)
          old_value = property.status
          put :update, params: { id: property.to_param, property: new_attributes }
          property.reload
          expect(property.status).not_to eql(old_value)
        end

        it 'assigns the requested property as  @property' do
          property = create(:property)
          put :update, params: { id: property.to_param, property: new_attributes }
          expect(assigns(:property)).to eq(property)
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the requested property' do
        property = create(:property)
        expect do
          delete :destroy, params: { id: property.to_param }
        end.to change(Property, :count).by(-1)
      end
    end
  end
end
