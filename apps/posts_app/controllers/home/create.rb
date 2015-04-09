require 'lotus/action/session'

module PostsApp::Controllers::Home
  class Create
    include PostsApp::Action
    include Lotus::Action::Session
    include SampleApp::Authenticable

    def call(params)
      if session[:user] and user = UserRepository.find_by_remember_token(session[:user])
        post = Post.new(title: params[:title], content: params[:content], user_id: user.id)
        PostRepository.create(post) if post.valid?
      end
      redirect_to '/posts_app'
    end
  end
end
