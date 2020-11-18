Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  scope '(:locale)' do
    get 'users/show'
    resources :users, :books
  end
end
