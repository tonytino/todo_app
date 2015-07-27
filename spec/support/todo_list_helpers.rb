module TodoListHelpers
  def visit_todo_list(list)
    visit "/todo_lists"

    # before rails_dom_id_helper: within "#todo_list_#{list.id}" do
    within dom_id_for(list) do
      click_link "List Items"
    end
  end
end