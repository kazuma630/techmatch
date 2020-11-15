# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      render :new and return
    end

    session["devise.regist_data"] = { user: @user.attributes }
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @detail = @user.build_detail
    render :new_detail
  end

  def create_detail
    @user = User.new(session["devise.regist_data"]["user"])
    @detail = Detail.new(detail_params)
    unless @detail.valid?
      render :new_detail and return
    end
    
    @user.build_detail(@detail.attributes)
    @user.save
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
  end

  # def edit
  #   @user = User.new
  # end

  # def update
  #   @user = User.find(account_update_params)
  #   unless @user.valid?
  #     render :edit and return
  #   end
  #   session["devise.regist_data"] = {user: @user.attributes}
  #   session["devise.regist_data"][:user]["password"] = params[:user][:password]
  #   @detail = @user.build_detail
  #   render :edit_detail
  # end

  # def update_detail
  #   @user = User.new(session["devise.regist_data"]["user"])
  #   @detail = Detail.find(params[:id])
  #     unless @detail.valid?
  #       render :edit_detail and return
  #     end
  #   @user.build_detail(@detail.attributes)
  #   @user.update
  #   session["devise.regist_data"]["user"].clear
  #   redirect_to user_path(params[id])
  # end

  def edit
    super
  end

  def update
    super
  end

  private

  def detail_params
    params.require(:detail).permit(:age, :area_id, :occupation_id, :genre_id, :school, :experience_id, :language_id, :interest_id, :pr)
  end
 
  # GET /resource/edit

  # PUT /resource
 
  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(_resource)
    root_path
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
