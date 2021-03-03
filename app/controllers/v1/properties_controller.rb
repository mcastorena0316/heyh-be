module V1
  class PropertiesController < ApplicationController
    before_action :load_property, only: %i[show update destroy]
    before_action :load_properties, only: %i[index]
    before_action :require_login

    def index
      render json: @properties
    end

    def show
      render json: @property
    end

    def create
      @property = Property.create(property_params)
      if @property.save
        render json: { property: @property }, status: 200
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

    def load_properties
      @properties = Property.all
      @properties = @properties.filter_by_status(params[:status]) if params[:status].present?
      @properties = @properties.filter_by_max_rental_price(params[:rental_price]) if params[:rental_price].present?
      @properties = @properties.order(created_at: :desc)
    end

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
        :tenant_name,
        tenant_availability: [
          :start_date,
          :end_date
        ]
      )
    end
  end
end
