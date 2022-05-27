Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists do
    resources :bookmarks, only: %i[index show new create]
  end
  resources :bookmarks, only: [:destroy]
end

#         Prefix  Verb    URI Pattern            Controller#Action
#     restaurants  GET     /restaurants           restaurants#index
#                 POST    /restaurants           restaurants#create
# new_restaurant  GET     /restaurants/new       restaurants#new
# edit_restaurant  GET     /restaurants/:id/edit  restaurants#edit
#     restaurant  GET     /restaurants/:id       restaurants#show
#                 PATCH   /restaurants/:id       restaurants#update
#                 DELETE  /restaurants/:id       restaurants#destroy

# A user can add a new bookmark (movie/list pair) to an existing list
# GET "lists/42/bookmarks/new"

# POST "lists/42/bookmarks"
# A user can delete a bookmark from a list. How can we make a delete link again?
# DELETE "bookmarks/25"
