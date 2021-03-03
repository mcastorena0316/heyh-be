require 'rails_helper'

module V1
  RSpec.describe PropertiesController, type: :routing do
    let(:path) { 'v1/users' }
    let(:controller) { 'v1/users' }

    describe 'routing' do
      it 'routes to #index' do
        expect(get: path).not_to be_routable
      end

      it 'routes to #create' do
        expect(post: path).to route_to(controller: controller, action: 'create')
      end
      it 'routes to #retrieve_token' do
        expect(get: "#{path}/retrieve_token").to route_to(controller: controller, action: 'retrieve_token')
      end

      it 'routes to #update via PUT' do
        expect(put: "#{path}/:id").not_to be_routable
      end

      it 'routes to #destroy' do
        expect(delete: "#{path}/:id").not_to be_routable
      end
    end
  end
end
