require 'lotus/action/session'

module TodosApp::Controllers::Home
  class Create
    include TodosApp::Action
    include Lotus::Action::Session
    include SampleApp::Authenticable

    def call(params)
      if session[:user] and user = UserRepository.find_by_remember_token(session[:user])
        todo = Todo.new(name: params[:name], category: params[:category], user_id: user.id )
        TodoRepository.create(todo) if todo.valid?
      end
      redirect_to '/todos_app'
    end
  end
end
