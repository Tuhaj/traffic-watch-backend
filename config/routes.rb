Rails.application.routes.draw do

  mount FrontEndBuilds::Engine, at: '/frontend-admin'

  get '/cities'                  => 'cities#index'
  get '/city/:name'              => 'cities#show',     as: 'city'
  get '/city/stats/:id'          => 'cities#stats',    as: 'city_stats'
  get '/stats/:name'             => 'stats#show',      as: 'stat'
  get '/samples/:marker_id'      => 'markers#samples', as: 'marker_samples'
  get '/marker_load/:marker_id'  => 'markers#load',    as: 'marker_load'

  front_end 'traffic-watch', '/'
end
