require 'rails_helper'

module V1
  RSpec.describe UsersController, type: :controller do

    let(:valid_attributes) do
      {
        name: Faker::Name.name,
        email: 'prueba123124',
        password: '1234343'
      }
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a User' do
          expect do
            post :create, params: valid_attributes
          end.to change(User, :count).by(1)
        end

        it 'assigns a newly created user as @user' do
          post :create, params: valid_attributes
          expect(assigns(:user)).to be_a(User)
          expect(assigns(:user)).to be_persisted
        end
      end
    end

    describe 'GET  #retrieve_token' do
      it 'retrieve token from user' do
        user = create(:user)
        get :retrieve_token, params: { email: user.email, password: user.password }
        response_body = JSON.parse(response.body)
        expect(response_body.keys).to eql ['user', 'jwt']
        expect(response.status).to eq(200)
      end
    end
  end
end
