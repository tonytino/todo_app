require 'spec_helper'

describe 'Creating todo lists' do
    def create_todo_list(args={})
        args[:title] ||= "My todo list"
        args[:description] ||= "This is my todo list."

        visit '/todo_lists'
        click_link 'New Todo list'
        expect(page).to have_content("New Todo List")

        fill_in "Title", with: args[:title]
        fill_in "Description", with: args[:description]
        click_button "Create Todo list"
    end

    it 'redirects to the todo list index page on success' do
        create_todo_list

        expect(page).to have_content("My todo list")
    end

    it 'displays an error when the todo list has no title' do
        # we expect that the database is cleared after each test
        expect(TodoList.count).to eq(0)

        create_todo_list title: "" # sending the title as an argument without any text

        # expect that we still don't have any todo lists in our db
        expect(TodoList.count).to eq(0)

        expect(page).to have_content("error")

        visit '/todo_lists'
        expect(page).to_not have_content("This is what I'm doing today.")
    end

    it 'displays an error when the todo list has a title less than 3 characters' do
        # we expect that the database is cleared after each test
        expect(TodoList.count).to eq(0)

        create_todo_list title: "Ti" # sending the title as an argument without enough characters

        # expect that we still don't have any todo lists in our db
        expect(TodoList.count).to eq(0)

        expect(page).to have_content("error")

        visit '/todo_lists'
        expect(page).to_not have_content("This is what I'm doing today.")
    end

    it 'displays an error when the todo list has no description' do
        # we expect that the database is cleared after each test
        expect(TodoList.count).to eq(0)

        create_todo_list title: "Grocery list", description: "" # sending the description as an argument without any text
        click_button "Create Todo list"

        # expect that we still don't have any todo lists in our db
        expect(TodoList.count).to eq(0)

        expect(page).to have_content("error")

        visit '/todo_lists'
        expect(page).to_not have_content("Grocery List")
    end

    it 'displays an error when the todo list has a description less than 5 characters' do
        # we expect that the database is cleared after each test
        expect(TodoList.count).to eq(0)

        create_todo_list title: "Grocery list", description: "Food" # sending the description as an argument without enough characters

        # expect that we still don't have any todo lists in our db
        expect(TodoList.count).to eq(0)

        expect(page).to have_content("error")

        visit '/todo_lists'
        expect(page).to_not have_content("Groceries List")
    end
end