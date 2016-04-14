class Users::SessionsController < Devise::SessionsController

  prepend_before_filter :require_no_authentication, :only => [:create ]
  
  before_filter :ensure_params_exist

  respond_to :json
  
  def create
    # build_resource
    resource = User.find_for_database_authentication(:email=>params[:user][:email])
    return invalid_login_attempt unless resource

    if resource.valid_password?(params[:user][:password])
      sign_in("user", resource)
      render :json=> {:success=>true, :authentication_token=>resource.authentication_token, :email=>resource.email}
      return
    end
    invalid_login_attempt
  end
  
  def destroy
    binding.pry
    current_user.authentication_token = nil
    current_user.save
    sign_out(current_user)
  end

  protected
  def ensure_params_exist
    return unless params[:user].blank?
    render :json=>{:success=>false, :message=>"missing user parameter"}, :status=>422
  end

  def invalid_login_attempt
    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  end


# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
