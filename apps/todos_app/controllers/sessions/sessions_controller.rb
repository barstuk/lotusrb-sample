require 'lotus/action/session'

module TodosApp::Controllers::Sessions
  class Login
    include Lotus::Controller
    include TodosApp::Action
    include Lotus::Action::Session

    def call(params)
      redirect_to '/todos_app' if (params[:email].empty? || params[:password].empty?)
      user = UserRepository.find_by_email(params[:email])
      if user.password == params[:password]
        session[:user] = user.remember_token
      end
      redirect_to '/todos_app'
    end
  end

  class Logout
    include Lotus::Controller
    include TodosApp::Action
    include Lotus::Action::Session

    def call(params)
      session[:user] = nil
      redirect_to '/todos_app'
    end
  end

  class Signup
    include SampleApp::Authenticable
    include Lotus::Controller
    include TodosApp::Action
    include Lotus::Action::Session

    def call(params)
      redirect_to '/todos_app' if (params[:email].empty? || params[:password].empty? || params[:name].empty?)
      user = User.new(email: params[:email], name: params[:name])
      user.password = params[:password]
      if user.valid?
        UserRepository.create(user)
        session[:user] = UserRepository.find_by_email(params[:email]).remember_token
        return redirect_to '/todos_app'
      end
    rescue Sequel::UniqueConstraintViolation
      redirect_to '/todos_app'
    end
  end
end
