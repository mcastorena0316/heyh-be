require 'rails_helper'

module V1
  RSpec.describe PropertiesController, type: :routing do
    let(:path) { 'v1/properties' }
    let(:controller) { 'v1/properties' }

    describe 'routing' do
      it 'routes to #index' do
        expect(get: path).to route_to(controller: controller, action: 'index')
      end

      it 'routes to #show' do
        expect(get: "#{path}/:id").to route_to(controller: controller, action: 'show', id: ':id')
      end

      it 'routes to #create' do
        expect(post: path).to route_to(controller: controller, action: 'create')
      end

      it 'routes to #update via PUT' do
        expect(put: "#{path}/:id").to route_to(controller: controller, action: 'update', id: ':id')
      end

      it 'routes to #update via PATCH' do
        expect(patch: "#{path}/:id").to route_to(controller: controller, action: 'update', id: ':id')
      end

      it 'routes to #destroy' do
        expect(delete: "#{path}/:id").to route_to(controller: controller, action: 'destroy', id: ':id')
      end
    end
  end
end
