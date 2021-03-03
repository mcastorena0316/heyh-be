module V1
  class PropertiesController < ApplicationController
    before_action :load_property, only: %i[show update destroy]

    def index
      @properties = Property.all
      render json: @properties
    end

    def show
      render json: @property
    end

    def create
      @property = Property.create(property_params)
      if @property.save
        render json: @property
      else
        render json: { error: 'Unable to create Property' }, status: 400
      end
    end

    def update
      if @property
        @property.update(property_params)
        render json: @property
      else 
        render json: { error: 'Unable to update Property' }, status: 400
      end
    end

    def destroy
      if @property
        @property.destroy
        render json: { message: 'Property succesfully deleted' }, status: 200
      else 
        render json: { error: 'Unable to delete Property' }, status: 400
      end
    end

    private

    def load_property
      @property = Property.find_by(id: params[:id])
    end

    def property_params
      params.require(:property).permit(
        :name,
        :description,
        :rental_price,
        :status,
        :tenant_email,
        :tenant_phone,
        :tenant_name
      )
    end
  end
end
