require 'rails_helper'

feature 'listener login into account' do
  scenario 'with valid data' do
    visit new_listener_session_path
    listener = create(:listener)
    fill_in 'Email', with: 'listener.email'
    fill_in 'Password', with: 'listener.password'

    click_button 'Log in'

    expect(page).to have_content('Login')
  end
end