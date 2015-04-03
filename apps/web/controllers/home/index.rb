module Web::Controllers::Home
  class Index
    include Web::Action

    def call(params)
      task = Task.new(name: "new")
      TaskRepository.create(task)
    end
  end
end
