require "rails_helper"

feature "user sign up and session management" do
  let(:user) { create :user }

  def sign_up_user
    visit root_path
    clear_emails
    fill_in "Full name", with: "Daphnes Nohansen Hyrule"
    fill_in "Email", with: "kingdaphnes@loz.com"
    click_on "Schedule a free consultation"
  end

  scenario "a user wants to sign up" do
    sign_up_user
    open_email "kingdaphnes@loz.com"
    current_email.click_link "this link"

    expect(page).to have_content "You are now signed in."
    expect(current_path).to eq new_consultation_path
  end

  scenario "a user tries to sign up with an expired auth token" do
    Timecop.freeze(1.day.ago) { sign_up_user }
    open_email "kingdaphnes@loz.com"
    current_email.click_link "this link"

    expect(page).to have_content "That link has expired. Please go to the sign in page and try again."
  end

  scenario "a user tries to sign up with an email that's already in the database" do
    sign_up_user
    sign_up_user

    expect(page).to have_content "Email has already been taken."
  end

  scenario "a user wants to sign in to an existing account" do
    visit root_path
    clear_emails
    click_on "Sign in"
    fill_in "Email", with: user.email
    click_on "Sign back in"
    open_email user.email
    current_email.click_link "this link"

    expect(page).to have_content "You are now signed in."
    expect(current_path).to eq new_consultation_path
  end

  scenario "a user wants to sign out" do
    sign_in user
    visit root_path
    click_on "Sign out"

    expect(page).to have_content "You are now signed out."
  end

  scenario "a user cannot sign in when they already are" do
    sign_in user
    visit new_session_path

    expect(page).to have_content "You are already signed in."
  end
end
