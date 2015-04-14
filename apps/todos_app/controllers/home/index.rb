require 'lotus/action/session'

module TodosApp::Controllers::Home
  class Index
    include TodosApp::Action
    include SampleApp::Authenticable

    expose(:todos_todo)
    expose(:todos_done)
    expose(:logged_user)
    expose(:signed_in)


    def call(params)
      @todos_todo = current_user ? TodoRepository.find_by_user_id(current_user.id).find_by_todo : nil
      @todos_done = current_user ? TodoRepository.find_by_user_id(current_user.id).find_by_done : nil
    end

    def logged_user
      current_user
    end

    def signed_in
      user_signed_in
    end

  end
end
