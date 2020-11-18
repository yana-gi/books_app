Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  scope '(:locale)' do
    resources :users, :books
  end
end
