module Web::Controllers::Home
  class Index
    include Web::Action

    def call(params)
      user = User.new(name: "p;d")
      UserRepository.create(user)
    end
  end
end
