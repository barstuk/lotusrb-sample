require 'lotus/action/session'

module TodosApp::Controllers::Home
  class Index
    include Lotus::Controller
    include TodosApp::Action
    include Lotus::Action::Session
    include SampleApp::Authenticable

    expose(:todos_todo)
    expose(:todos_done)
    expose(:logged_user)
    expose(:signed_in)


    def call(params)
      @todos_todo = current_user ? TodoRepository.find_by_user_id_and_todo(current_user.id) : nil
      @todos_done = current_user ? TodoRepository.find_by_user_id_and_done(current_user.id) : nil
    end

    def logged_user
      current_user
    end

    def signed_in
      user_signed_in
    end

  end
end
