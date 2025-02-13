Rails.application.routes.draw do

# Here are the user actions we want to implement in our app:
# As a user, I can see all my movie lists
# As a user, I can create a movie list
# As a user, I can see the details of a movie list
# As a user, I can bookmark a movie inside a movie list
# As a user, I can destroy a bookmark

resources :movies, only: [:index, :show]

resources :lists, only: [:index, :show, :new, :create] do
  resources :bookmarks, only: [:new, :create]  # A bookmark belongs to a list
end

resources :bookmarks, only: [:destroy]
end
