require 'lotus/action/session'
module TodosApp::Controllers::Home
  class ToggleDone
    include TodosApp::Action
    include Lotus::Action::Session
    include SampleApp::Authenticable

    def call(params)
      @t = TodoRepository.find(params[:id].to_i)
      toggle_done(@t) if @t
      redirect_to '/todos_app'
    end

    # def toggle_done(t)
    #   @todo = current_user ? (@t if @t.user_id == current_user.id) : nil
    #   if @todo
    #     @todo.done ^= true
    #     TodoRepository.update(@todo)
    #   end
    # end
  end
end
