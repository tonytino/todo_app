require 'spec_helper'

describe 'Editing todo lists' do
    let!(:todo_list) { TodoList.create(title: "Gorceries", description: "Grocery list.") } # creates a variable called todo_list that contains a newly created todo_list item

    def update_todo_list(args={})
        args[:title] ||= "My todo list"
        args[:description] ||= "This is my todo list."
        todo_list = args[:todo_list]

        visit '/todo_lists'
        within "#todo_list_#{todo_list.id}" do # target the specific todo_list item just created by selecting the dom element with the matching id
            click_link "Edit"
        end

        fill_in "Title", with: args[:title]
        fill_in "Description", with: args[:description]
        click_button "Update Todo list"
    end

    it 'updates a todo list successfully with correct information' do

        update_todo_list todo_list: todo_list,
                         title: "New title",
                         description: "New description"

        todo_list.reload # updates the attributes (title/desc) for this todo_list item based on the latest data within the db

        expect(page).to have_content("Todo list was successfully updated")
        expect(todo_list.title).to eq("New title")
        expect(todo_list.description).to eq("New description")
    end

    it 'displays an error with no title' do
        update_todo_list todo_list: todo_list, title: ""
        title = todo_list.title
        todo_list.reload
        expect(todo_list.title).to eq(title) # we expect that the title hasn't changed
        expect(page).to have_content("error")
    end

    it 'displays an error with too short a title' do
        update_todo_list todo_list: todo_list, title: "hi"
        title = todo_list.title
        todo_list.reload
        expect(todo_list.title).to eq(title) # we expect that the title hasn't changed
        expect(page).to have_content("error")
    end

    it 'displays an error with no description' do
        update_todo_list todo_list: todo_list, description: ""
        description = todo_list.description
        todo_list.reload
        expect(todo_list.description).to eq(description) # we expect that the description hasn't changed
        expect(page).to have_content("error")
    end


    it 'displays an error with too short a description' do
        update_todo_list todo_list: todo_list, description: "hi"
        description = todo_list.description
        todo_list.reload
        expect(todo_list.description).to eq(description) # we expect that the description hasn't changed
        expect(page).to have_content("error")
    end
end