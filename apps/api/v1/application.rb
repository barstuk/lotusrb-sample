module ApiV1
  class Application < Lotus::Application
    configure do
      root __dir__

      body_parsers :json
      default_format :json

      routes 'config/routes'

      load_paths << [
        'helpers',
        'controllers',
        'presenters'
      ]

      controller.prepare do
        # before callbacks
      end

      view.prepare do
        # before callbacks
      end
    end
  end
end
