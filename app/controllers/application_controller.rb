class ApplicationController < ActionController::Base
  around_action :switch_locale
  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!
  # deviseコントローラーにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ロケールを変更する
  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  # デフォルトのロケール設定
  def default_url_options
    { locale: I18n.locale }
  end

  # ログイン後は/booksに遷移する
  def after_sign_in_path_for(_resource)
    books_path
  end

  # ログアウト後はログインページに遷移する
  def after_sign_out_path_for(_resource)
    new_user_session_path
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :postal_code,:address,:description,:password_confirmation, :remember_me]
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
end
