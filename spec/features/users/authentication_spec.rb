require 'spec_helper'

describe 'Logging In' do
  it 'displays the email address in the event of a failed login' do
    visit new_user_session_path
    fill_in 'Email Address', with: 'fake@email.com'
    fill_in 'Password', with: 'incorrect'
    click_button 'Log In'

    expect(page).to have_content('Please check your email and password')
    expect(page).to have_field('Email', with: 'fake@email.com')
  end
end
