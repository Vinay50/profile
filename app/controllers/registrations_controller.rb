 class RegistrationsController < Devise::RegistrationsController
  respond_to :html, :json

  # Signs in a user on sign up. You can overwrite this method in your own
  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
    flash[:notice] = "Sign up successfully."
  end
end
