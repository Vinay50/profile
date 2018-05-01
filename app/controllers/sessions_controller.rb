class SessionsController < Devise::SessionsController
  respond_to :html, :js
  before_filter :handle_redirect, :if => Proc.new { |c| c.request.format == :json }

  def create
    resource = warden.authenticate!(auth_options)
    sign_in_and_redirect(resource_name, resource)
    flash[:notice] = "logged in successfully."
    binding.pry
  end

  # def sign_in_and_redirect(resource_or_scope, resource=nil)
  #   scope = Devise::Mapping.find_scope!(resource_or_scope)
  #   resource ||= resource_or_scope
  #   sign_in(scope, resource) unless warden.user(scope) == resource
  #   flash[:notice] = "Logged in successfully."
  #   flash.keep(:notice)
  #   # if current_user && current_user.is_admin
  #   #   render js: "window.location = #{dashboard_path.to_json}"
  #   # else
  #     render js: "window.location = #{stories_path.to_json}"
  #   # end
  #   binding.pry
  # end

  def failure
    warden.custom_failure!
    render json: { success: false, error: I18n.t("devise.failure.#{env['warden'].message.to_s}") }, status: 401
  end

  protected

  def auth_options
    {:scope => resource_name, :recall => "#{controller_path}#failure"}
  end
end
