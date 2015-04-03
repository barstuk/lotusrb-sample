module TodosApp::Controllers::Home
  class Index
    include TodosApp::Action

    def call(params)
      todo = Todo.new(name: "my first todo!")
      TodoRepository.create(todo)
    end
  end
end
