require 'rails_helper'

describe 'admin edit channel' do
  before do
    auth_admin
  end

  scenario 'with valid data' do
    channel = create(:channel)
    visit edit_admin_channel_path(channel)

    fill_in 'Name', with: 'Demo Name'
    page.attach_file('channel[image]', "#{Rails.root}/spec/support/fixtures/cover256x256.jpg")

    click_button 'Update'

    expect(page).to have_content('Successfully updated')
  end

  scenario 'with invalid data' do
    channel = create(:channel)
    visit edit_admin_channel_path(channel)

    fill_in 'Name', with: nil

    click_button 'Update'

    expect(find('.channel_name')).to have_content('can\'t be blank')
    expect(find('.channel_image')).to have_content('can\'t be blank')
  end

  def auth_admin
    admin_user = create(:listener, is_admin: true)

    visit new_listener_session_path

    fill_in 'Email', with: admin_user.email
    fill_in 'Password', with: admin_user.password
    click_button 'Log in'

    expect(page).to have_content('Admin Board')
  end
end