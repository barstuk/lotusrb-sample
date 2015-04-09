require 'lotus/action/session'

module PostsApp::Controllers::Sessions
  class Login
    include Lotus::Controller
    include PostsApp::Action
    include Lotus::Action::Session

    def call(params)
      redirect_to '/'
    end
  end

  class Logout
    include Lotus::Controller
    include PostsApp::Action
    include Lotus::Action::Session

    def call(params)
      session[:user] = nil
      redirect_to '/posts_app'
    end
  end

  class Signup
    include PostsApp::Authenticable
    include Lotus::Controller
    include PostsApp::Action
    include Lotus::Action::Session

    def call(params)
      user = User.new(email: params[:email], name: params[:name])
      user.password = params[:password]
      if user.valid?
        UserRepository.create(user)
        session[:user] = UserRepository.find_by_email(params[:email]).remember_token
        return redirect_to '/posts_app'
      end
    rescue Sequel::UniqueConstraintViolation
      redirect_to '/posts_app'
    end
  end
end
