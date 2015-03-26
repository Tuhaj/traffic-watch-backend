Rails.application.routes.draw do

  mount FrontEndBuilds::Engine, at: '/frontend-admin'

  get '/cities'                  => 'cities#index'
  get '/city/:name'              => 'cities#show',     as: 'city'
  get '/city/stats/:id'          => 'cities#stats',    as: 'city_stats'
  get '/stats/:name'             => 'stats#show',      as: 'stat'

  resources :markers, only: [] do
    member do
      get :sample
    end
  end

  front_end 'traffic-watch', '/'
end
