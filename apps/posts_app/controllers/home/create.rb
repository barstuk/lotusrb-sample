module PostsApp::Controllers::Home
  class Create
    include PostsApp::Action

    def call(params)
      post = Post.new(title: params[:title], content: params[:content])
      PostRepository.create(post) if post.valid?
      redirect_to '/posts_app'
    end
  end
end