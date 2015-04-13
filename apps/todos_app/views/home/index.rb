require 'lotus/action/session'

module TodosApp::Views::Home
  class Index
    include TodosApp::View

    layout :application

    def button_to(method, title)
      raw %(<button type="submit" class="btn btn-primary" formmethod=#{method}>#{title}</button>)
    end
  end
end
