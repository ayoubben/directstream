Rails.application.routes.draw do
  
  root 'locations#index'
  resources :locations do
    collection do
      get "/convert_adress", to: "locations#convert_adress"
    end
  end

  namespace :api do
    resources :locations, :defaults => { :format => 'json' }
  end

end
