require 'lotus/action/session'

module PostsApp::Controllers::Home
  class Index
    include Lotus::Controller
    include PostsApp::Action
    include Lotus::Action::Session
    include PostsApp::Authenticable

    expose(:posts)
    expose(:logged_user)

    def call(params)
      @posts = PostRepository.all
    end

    def logged_user
      @logged_user = @logged_user || current_user
    end

  end
end
