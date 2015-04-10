require 'lotus/validations'

class Todo
  include Lotus::Entity
  include Lotus::Validations
  attribute :name, presence: :true
  attribute :done
  attribute :created_at
  attribute :updated_at
  attribute :user_id
  attribute :category

  def toggle_done(t)
    byebug
    @todo = current_user ? (@t if @t.user_id == current_user.id) : nil
    if @todo
      @todo.done ^= true
      TodoRepository.update(@todo)
    end
  end
end
