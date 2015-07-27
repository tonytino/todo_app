module RailsDomIdHelper
  def dom_id_for(model)
    # returns something like "#todo_list_3"
    # replaces "#todo_list_#{list.id}" in spec/feature/todo_items/*_spec.rb
    ['#', ActionView::RecordIdentifier.dom_id(model)].join
  end
end