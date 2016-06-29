require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  describe '#account_button_path' do
    it 'returns destroy session path if listener signed in' do
      stub_listener is_signed_in: true

      result = helper.account_button_path

      expect(result).to eq(destroy_listener_session_path)
    end

    it 'returns new session path if listener signed out' do
      stub_listener is_signed_in: false

      result = helper.account_button_path

      expect(result).to eq(new_listener_session_path)
    end


  end

  describe '#account_button_text' do
    it 'returns "Logout" if user signed in' do
      stub_listener is_signed_in: true

      result = helper.account_button_text

      expect(result).to eq('Logout')
    end

    it 'returns "Login" if user signed out' do
      stub_listener is_signed_in: false

      result = helper.account_button_text

      expect(result).to eq('Login')
    end
  end

  def stub_listener(is_signed_in: false)
    allow(view).to receive(:listener_signed_in?).and_return(is_signed_in)
  end
end
