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

  def toggle_done(user)
    update = user ? user_id == user.id : false
    if update
      self.done ^= true
      TodoRepository.update(self)
    end
  end
end
