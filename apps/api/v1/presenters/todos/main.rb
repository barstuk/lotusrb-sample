require 'representative/json'

module ApiV1
  module Presenters
    module Todos
      class Main
        attr_reader :todos

        def initialize(todos)
          @todos = todos
        end

        def render
          Representative::Json.new do |r|
            r.list_of :todos, todos do
              r.element :id
              r.element :name
              r.element :category
              r.element :created_at
            end
          end.to_s
        end
      end
    end
  end
end
