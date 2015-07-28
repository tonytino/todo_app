class TodoList < ActiveRecord::Base
    has_many :todo_items

    validates :title, :description, presence: true
    validates :title, length: { minimum: 3 }
    validates :description, length: { minimum: 5 }

    def has_completed_items?
      !todo_items.complete.empty?
    end

    def has_incomplete_items?
      !todo_items.incomplete.empty?
    end
end
