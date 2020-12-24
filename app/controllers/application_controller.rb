class ApplicationController < ActionController::Base
  around_action :switch_locale
  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
