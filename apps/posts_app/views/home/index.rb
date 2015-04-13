require 'lotus/action/session'

module PostsApp::Views::Home
  class Index
    include PostsApp::View

    layout :application

    def button_to(method, title)
      raw %(<button type="submit" class="btn btn-success" formmethod=#{method}>#{title}</button>)
    end
  end
end
