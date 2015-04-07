module PostsApp::Controllers::Home
  class Index
    include PostsApp::Action

    expose(:posts)

    def call(params)
      @posts = PostRepository.all
    end
  end
end
