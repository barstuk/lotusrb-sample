module Another::Controllers::Home
  class Index
    include Another::Action

    def call(params)
      user = User.new(name: "new")
      UserRepository.create(user)
    end
  end
end
