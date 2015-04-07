module PostsApp::Views::Home
  class Index
    include PostsApp::View
    include Lotus::Helpers
    include Lotus::Helpers::HtmlHelper

    def button_to(method, title)
      raw %(<button type="submit" formmethod=#{method}>#{title}</button>)
    end
  end
end
