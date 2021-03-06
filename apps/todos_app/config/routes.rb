# # Configure your routes here
# # See: http://www.rubydoc.info/gems/lotus-router/#Usage
# #
# #
# #
# # This route will look for `Web::Controllers::Home::Index` action in `apps/web/controllers/home/index.rb`.
# # Please, uncomment the following line to have a working example.
get '/', to: 'home#index'
post '/', to: 'home#create'
post 'change_token', to: 'sessions#changetoken'
post '/todos/:id', to: 'home#toggle_done'
post 'sign_up', to: 'sessions#signup'
post 'login', to: 'sessions#login'
get 'logout', to: 'sessions#logout'