require 'lotus/action/session'

module TodosApp::Views::Home
  class Index
    include TodosApp::View
    include SampleApp::Authenticable
    include Lotus::Helpers
    include Lotus::Helpers::HtmlHelper
    include Lotus::Action::Session
    include Lotus::Controller

    layout :application

    def button_to(method, title)
      raw %(<button type="submit" class="btn btn-primary" formmethod=#{method}>#{title}</button>)
    end
  end
end
