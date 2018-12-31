require "rails_helper"

feature "sign up" do
  scenario "a user signs up for a new account" do
    visit root_path
    click_on "Sign Up"
    expect(page).to have_content "Join Novum Opus"
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Smith"
    fill_in "Email", with: "john.smith@example.com"
    click_on "Create Account"
    expect(page).to have_content "Thanks for signing up! Your verification email has been sent."
  end
end
