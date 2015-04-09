require 'lotus/action/session'

module TodosApp::Controllers::Home
  class Index
    include Lotus::Controller
    include TodosApp::Action
    include Lotus::Action::Session
    include SampleApp::Authenticable

    expose(:todos)
    expose(:logged_user)
    expose(:signed_in)


    def call(params)
      @todos = TodoRepository.find_by_user_id(current_user.id)
    end

    def logged_user
      current_user
    end

    def signed_in
      user_signed_in
    end

  end
end
