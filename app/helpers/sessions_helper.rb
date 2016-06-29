module SessionsHelper
  def account_button_path
    if listener_signed_in?
      destroy_listener_session_path
    else
      new_listener_session_path
    end
  end

  def account_button_text
    if listener_signed_in?
      'Logout'
    else
      'Login'
    end
  end
end