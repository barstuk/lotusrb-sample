# Configure your routes here
# See: http://www.rubydoc.info/gems/lotus-router/#Usage
namespace 'todos' do
  get '/', to: 'todos#index'
  get '/todo', to: 'todos#todo'
  get '/todo/:category', to: 'todos#todo_category'
  get '/done', to: 'todos#done'
  get '/done/:category', to: 'todos#done_category'
end
