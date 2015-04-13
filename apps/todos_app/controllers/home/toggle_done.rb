require 'lotus/action/session'
module TodosApp::Controllers::Home
  class ToggleDone
    include TodosApp::Action
    include SampleApp::Authenticable

    def call(params)
      @todo = TodoRepository.find(params[:id].to_i)
      @todo.toggle_done(current_user) if @todo
      redirect_to '/todos_app'
    end
  end
end
