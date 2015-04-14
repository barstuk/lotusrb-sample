require 'lotus/action/session'

module PostsApp::Controllers::Home
  class Create
    include PostsApp::Action
    include SampleApp::Authenticable

    def call(params)
      if session[:user] and user = UserRepository.find_by_remember_token(session[:user])
        post = Post.new(title: params[:title], content: params[:content], user_id: user.id)
        if post.valid?
          releated_todo = TodoRepository.find_by_user_id(current_user.id).find_by_todo.find_by_category("post").find_by_name(post.title).first
          if releated_todo
            releated_todo.done = true
            TodoRepository.update(releated_todo)
          end
          PostRepository.create(post)
        end
      end
      redirect_to '/posts_app'
    end
  end
end
