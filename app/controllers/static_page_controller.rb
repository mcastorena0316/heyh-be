class StaticPageController < ApplicationController
  def home
    render json: 'Welcome to Homies\'s API'
  end
end