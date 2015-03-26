Rails.application.routes.draw do

  mount FrontEndBuilds::Engine, at: '/frontend-admin'

  resources :cities, only: [:index], param: :name do
    member do
      get :stats
    end
  end
  resources :markers, only: [] do
    member do
      get :sample
    end
  end

  front_end 'traffic-watch', '/'
end
