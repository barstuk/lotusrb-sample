module Another::Controllers::Home
  class Index
    include Another::Action

    def call(params)
      task = Task.new(name: "new")
      TaskRepository.create(task)
    end
  end
end
