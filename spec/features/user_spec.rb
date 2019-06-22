require "rails_helper"

feature "user sign up and session management" do
  let(:user) { create :user }

  scenario "a user wants to sign up" do
    visit root_path
    clear_emails
    fill_in "Full name", with: "John Smith"
    fill_in "Email", with: "john.smith@example.com"
    click_on "Schedule a consultation"
    open_email("john.smith@example.com")
    current_email.click_link "this link"
    expect(page).to have_content "You have been signed in!"
  end

  scenario "a user wants to sign in to an existing account" do
    visit root_path
    click_on "Sign in"
    fill_in "Email", with: user.email
    click_on "Sign back in"
    open_email(user.email)
    current_email.click_link "this link"
    expect(page).to have_content "You have been signed in!"
  end

  scenario "a user wants to sign out" do
    sign_in user
    visit root_path
    click_on "Sign out"
    expect(page).to have_content "You are now signed out."
  end

  scenario "a user cannot tries to sign in when they already are" do
    sign_in user
    visit new_session_path
    expect(page).to have_content "You are already signed in!"
  end
end
