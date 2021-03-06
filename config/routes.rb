Rails.application.routes.draw do
  
  get 'favorites/index'

  resources 'friendships'

	get 'search' =>'places#search'
	get 'search_result' =>'places#search_result'
  get 'about' => 'welcome#about'

	resources :visits, only: :destroy do
		resources :recommendations, only: [:create, :new]
	end

	resources :places do
  	resources :visits, except: [:index, :destroy]
  end

  root 'welcome#index'
  resources :users do
  	resources :recommendations, only: :index
  	resources :visits, only: :index
  end
  resources :recommendations, only: [:destroy, :show]

  post 'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy'

  resources :favorites

  delete 'place_favorites' =>'favorites#delete_favorite'

end
