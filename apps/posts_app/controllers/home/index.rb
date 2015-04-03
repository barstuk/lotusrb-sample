module PostsApp::Controllers::Home
  class Index
    include PostsApp::Action

    def call(params)
      post = Post.new(title: "new", content: "my first post!")
      PostRepository.create(post)
    end
  end
end
