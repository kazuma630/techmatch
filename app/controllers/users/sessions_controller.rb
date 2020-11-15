# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "太郎"
    end

    Detail.find_or_create_by!(user_id: user.id) do |detail|
      detail.age = '21'
      detail.area_id = '2'
      detail.occupation_id = '18'
      detail.genre_id = '1'
      detail.school = ''
      detail.experience_id = '1'
      detail.language_id = '4'
      detail.interest_id = '2'
      detail.pr = 'web系エンジニアの働き方や仕事に興味がありアプリをはじめました。何卒よろしくお願いします！'
    end

    sign_in user
    
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

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
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
