module SessionHelpers
  def sign_in user
    page.set_rack_session email: user.email
  end
end
