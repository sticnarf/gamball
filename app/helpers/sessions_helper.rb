module SessionsHelper
  def sign_in(user)
    cookies.permanent[:remember_token] = generate_token(user)
    @current_user = user
  end

  def sign_out
    if signed_in?
      generate_token(current_user)
      @current_user = nil
    end
  end

  def current_user
    @current_user ||= User.find_by(:remember_token => cookies[:remember_token])
  end

  def signed_in?
    current_user != nil
  end

  private
  def generate_token(user)
    token = SecureRandom.base64(32)
    user.update_attributes!(:remember_token => token)
    token
  end
end
