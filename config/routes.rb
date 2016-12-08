Salaverde::Application.routes.draw do

  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    get 'about'   => 'static_pages#about'
    resources :salas
  end

  root 'salas#index'
end
