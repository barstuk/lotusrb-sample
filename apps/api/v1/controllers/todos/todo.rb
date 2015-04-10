module ApiV1
  module Controllers
    module Todos
      class Todo
        include ApiV1::Action
        include ApiV1::Helpers::TodoHelper
        accept :json

        def call(params)
          token = @_env["HTTP_X_USER_ACCESS_TOKEN"]
          user = set_user(token)
          todos = TodoRepository.find_by_user_id_todo(user.id)
          self.body = ApiV1::Presenters::Todos::Main.new(todos).render
        end
      end
    end
  end
end
