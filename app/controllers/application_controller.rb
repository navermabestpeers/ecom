class ApplicationController < ActionController::Base
  #protect_from_frogery with: :exception
  skip_before_action :verify_authenticity_token
  include ApplicationHelper
  before_action :authenticate_user!, except: [:index,:create,:show,:destroy]
  before_action :configure_permitted_parameters, if: :devise_controller?
#  after_sign_in :after_sign_in_path_for
  def after_sign_in_path_for(resource)
    if current_user.has_role? :seller
      products_path
    else
      root_path
    end
  end

  protected  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :role_ids , address_attributes: [:address_1, :address_2, :city, :state, :country, :postal_code]])
  end
end
