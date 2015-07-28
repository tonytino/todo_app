require 'spec_helper'

describe TodoList do
    it { should have_many(:todo_items) }

    context '#has_completed_items?' do
      let!(:todo_list) { TodoList.create(title: 'Groceries', description: 'Grocery List') }

      it 'returns true with completed todo list items' do
        todo_list.todo_items.create(content: 'Eggs', completed_at: Time.now)
        expect(todo_list.has_completed_items?).to be true
      end

      it 'returns false with no completed todo list items' do
        todo_list.todo_items.create(content: 'Eggs')
        expect(todo_list.has_completed_items?).to be false
      end
    end

    context '#has_incomplete_items?' do
      let!(:todo_list) { TodoList.create(title: 'Groceries', description: 'Grocery List') }

      it 'returns true with incompleted todo list items' do
        todo_list.todo_items.create(content: 'Eggs')
        expect(todo_list.has_incomplete_items?).to be true
      end

      it 'returns false with no incomplete todo list items' do
        todo_list.todo_items.create(content: 'Eggs', completed_at: Time.now)
        expect(todo_list.has_incomplete_items?).to be false
      end
    end
end
