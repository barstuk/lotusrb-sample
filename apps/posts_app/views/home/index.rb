require 'lotus/action/session'

module PostsApp::Views::Home
  class Index
    include PostsApp::View
    include SampleApp::Authenticable
    include Lotus::Helpers
    include Lotus::Helpers::HtmlHelper
    include Lotus::Action::Session
    include Lotus::Controller

    layout :application

    def button_to(method, title)
      raw %(<button type="submit" class="btn btn-success" formmethod=#{method}>#{title}</button>)
    end
  end
end
