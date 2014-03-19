BetweenUNMe::Application.routes.draw do
  root 'points#new'
  resources :points, :only => [:new, :index, :create]
  #this generates ->
    # get '/points/new' => 'points#new'
    # get '/points' => 'points#index'
    # post "/points" => "points#create"

  post "/points/yelp" => "points#yelp_business_nearby", as: :yelp_nearby

end
