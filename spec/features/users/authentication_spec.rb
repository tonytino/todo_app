require 'spec_helper'

describe 'Logging In' do
  it 'logs the user in and goes to the todo lists' do
    User.create(first_name: 'Anthony', last_name: 'Hernandez', email: 'anthony@mail.com', password: 'monkey123', password_confirmation: 'monkey123')

    visit new_user_session_path
    fill_in 'Email Address', with: 'anthony@mail.com'
    fill_in 'Password', with: 'monkey123'
    click_button 'Log In'

    expect(page).to have_content('Todo Lists')
    expect(page).to have_content('Thanks for logging in!')
  end

  it 'displays the email address in the event of a failed login' do
    visit new_user_session_path
    fill_in 'Email Address', with: 'fake@email.com'
    fill_in 'Password', with: 'incorrect'
    click_button 'Log In'

    expect(page).to have_content('Please check your email and password')
    expect(page).to have_field('Email', with: 'fake@email.com')
  end
end
