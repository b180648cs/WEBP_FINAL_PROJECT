Rails.application.routes.draw do
  resources :books
  #get 'home/index'
  get 'home/about'
  get '/api/v1/books' , to: 'books#home'
  get '/api/v1/books/:id' , to: 'books#book'
  post '/api/v1/books' , to:'books#newBook'
  root 'home#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
