require 'lotus/action/session'

module TodosApp::Controllers::Home
  class MarkAsDone
    include TodosApp::Action
    include Lotus::Action::Session
    include SampleApp::Authenticable

    def call(params)
      @t = TodoRepository.find(params[:id].to_i)
      @todo = current_user ? (@t if @t.user_id == current_user.id) : nil
      @todo.update(done: true) && TodoRepository.update(@todo) if @todo
      redirect_to '/todos_app'
    end
  end
end
