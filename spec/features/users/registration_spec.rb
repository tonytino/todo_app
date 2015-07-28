require 'spec_helper'

describe 'Signing up' do

  it 'allows a user to sign up for the site and creates the object in the database' do
    expect(User.count).to eq(0)

    visit '/'
    expect(page).to have_content('Sign Up')
    click_link 'Sign Up'

    fill_in 'First Name', with: 'Anthony'
    fill_in 'Last Name', with: 'Hernandez'
    fill_in 'Email', with: 'Anthony@mail.com'
    fill_in 'Password', with: 'monkey123'
    fill_in 'Password (again)', with: 'monkey123'
    click_button 'Sign Up'

    expect(User.count).to eq(1)
  end

end