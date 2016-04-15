class Users::SessionsController < Devise::SessionsController

  prepend_before_filter :require_no_authentication, :only => [:create ]

  respond_to :json
  

  def create
    ensure_params_exist
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
    sign_out(current_user)
    render :json=> {:success=>true}
  end


  private
  def ensure_params_exist
    return unless params[:user].blank?
    render :json=>{:success=>false, :message=>"missing user parameter"}, :status=>422
  end

  def invalid_login_attempt
    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  end


end
