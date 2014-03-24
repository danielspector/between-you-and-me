BetweenUNMe::Application.routes.draw do
  root 'points#new'
  resources :points, :only => [:new, :create]
  #this generates ->
    # get '/points/new' => 'points#new'
    # get '/points' => 'points#index'
    # post "/points" => "points#create"

  post "/points/yelp" => "points#yelp_business_nearby", as: :yelp_nearby

  get "/center/:id" => "centers#show", as: :center

end
