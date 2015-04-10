require 'spec_helper'

describe Todo do
  describe '#toggle_done' do
    before do
      @user = build(:user)
      @user = UserRepository.create(@user)
      @todo = build(:todo, done: false, user_id: @user.id)
      @todo = TodoRepository.create(@todo)
    end

    context 'user is owner of todo' do
      it 'updates done: true if was false' do
        @todo.toggle_done(@user)
        expect(@todo.done).to eq true
      end
      it 'updates done: false if was true' do
        @todo.update(done: true)
        TodoRepository.update(@todo)
        @todo.toggle_done(@user)
        expect(@todo.done).to eq false
      end
    end
    context 'user is owner of todo' do
      before do
        @user2 = build(:user)
        @user2 = UserRepository.create(@user2)
      end
      it 'does not update done attribute' do
        @todo.toggle_done(@user2)
        expect(@todo.done).to eq false
      end
    end
  end
end
