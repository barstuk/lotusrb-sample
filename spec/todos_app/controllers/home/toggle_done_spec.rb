require 'spec_helper'

describe TodosApp::Controllers::Home::ToggleDone do
  describe '#toggle_done' do
    before do
      @user = build(:user)
      @user = UserRepository.create(@user)
      @todo = build(:todo, done: false, user_id: @user.id)
      @todo = TodoRepository.create(@todo)
    end
    it 'updates done: true if was false' do
      toggle_done(@todo)
      expect(@todo.done).to eq true
    end
  end
end
