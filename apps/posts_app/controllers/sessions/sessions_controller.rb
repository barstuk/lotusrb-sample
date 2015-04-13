require 'lotus/action/session'

module PostsApp::Controllers::Sessions
  class Login
    include PostsApp::Action

    def call(params)
      redirect_to '/posts_app' if (params[:email].empty? || params[:password].empty?)
      user = UserRepository.find_by_email(params[:email])
      if user.password == params[:password]
        session[:user] = user.remember_token
      end
      redirect_to '/posts_app'
    end
  end

  class Logout
    include Lotus::Controller
    include PostsApp::Action

    def call(params)
      session[:user] = nil
      redirect_to '/posts_app'
    end
  end

  class Signup
    include PostsApp::Action

    def call(params)
      redirect_to '/posts_app' if (params[:email].empty? || params[:password].empty? || params[:name].empty?)
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

  class Changetoken
    include PostsApp::Action

    def call(params)
      redirect_to '/posts_app' unless session[:user]
      user = UserRepository.find_by_remember_token(session[:user])
      user = user.reset_token!
      session[:user] = user.remember_token
      redirect_to '/posts_app'
    end
  end
end
