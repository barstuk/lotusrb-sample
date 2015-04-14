module ApiV1
  module Controllers
    module Todos
      class DoneCategory
        include ApiV1::Action
        include ApiV1::Helpers::TodoHelper
        accept :json

        def call(params)
          token = @_env["HTTP_X_USER_ACCESS_TOKEN"]
          user = set_user(token)
          todos = TodoRepository.find_by_user_id(user.id).find_by_done.find_by_category(params[:category])
          self.body = ApiV1::Presenters::Todos::Main.new(todos).render
        end
      end
    end
  end
end
