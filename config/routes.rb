Rails.application.routes.draw do

  mount FrontEndBuilds::Engine, at: '/frontend-admin'

  resources :cities, only: [:index], param: :name do
    member do
      get :stats
      get :traffic
    end
  end

  front_end 'traffic-watch', '/'
end
