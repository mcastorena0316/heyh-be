require 'rails_helper'

module V1
  RSpec.describe PropertiesController, type: :controller do
    before do
      @user = create(:user)
      @token = JWT.encode({ user: User.first.id, exp: 15.minutes.from_now.to_i }, 's3cr3t')
      request.headers['Authorization'] = @token
    end

    let(:valid_attributes) do
      {
        name: Faker::Name.name,
        description: Faker::Lorem.sentence,
        rental_price: 4000,
        status: 'published',
        tenant_name: Faker::Name.name,
        tenant_email: Faker::Internet.email,
        tenant_phone: Faker::PhoneNumber.phone_number
      }
    end

    describe 'GET #index' do
      it 'assigns all propierties as @propierties' do
        property = create(:property)
        get :index
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

    # describe 'POST #create' do
    #   context 'with valid params' do
    #     it 'creates a new Property' do
    #       post :create, params: { property: valid_attributes }
    #       response_body = JSON.parse(response.body)
    #       expect(response_body.keys).to eql ["property", "code"]
    #       expect(response_body["code"]).to eql 200
    #     end
    #   end
    # end
  end
end
