require 'lotus/action/session'

module PostsApp::Controllers::Home
  class Index
    include Lotus::Controller
    include PostsApp::Action
    include Lotus::Action::Session
    include SampleApp::Authenticable

    expose(:posts)
    expose(:logged_user)
    expose(:signed_in)

    def call(params)
      @posts = current_user ? PostRepository.find_by_user_id(current_user.id) : nil
    end

    def logged_user
      current_user
    end

    def signed_in
      user_signed_in
    end
  end
end