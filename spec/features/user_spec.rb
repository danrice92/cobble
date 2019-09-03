require "rails_helper"

feature "user sign up and session management" do
  let(:user) { create :user }

  before do
    clear_emails
  end

  def sign_up_user
    visit root_path
    fill_in "Full name", with: "Daphnes Nohansen Hyrule"
    fill_in "Email", with: "kingdaphnes@loz.com"
    click_on "Schedule a free consultation"
  end

  scenario "a user wants to sign up" do
    sign_up_user
    open_email "kingdaphnes@loz.com"
    current_email.click_link "this link"

    expect(page).to have_content "You are now signed in."
    expect(User.count).to eq 1
    expect(current_path).to eq new_consultation_path
  end

  scenario "a user signs up and their phone capitalizes their email" do
    sign_up_user
    visit new_session_path
    fill_in "Email", with: "Kingdaphnes@loz.com"
    click_on "Sign back in"

    expect(page).not_to have_content "We could not find record of that email."
    expect(page).to have_content "We have sent you a login link."
  end

  scenario "a bot tries to sign up" do
    visit root_path
    fill_in "Full name", with: "Scrapper"
    fill_in "Email", with: "scrapper@loz.com"
    fill_in "If you are a human, ignore this field", with: "I'm a bot"
    click_on "Schedule a free consultation"

    expect(page).to have_content "Silly bot!"
  end

  scenario "a user tries to sign up with an expired auth token" do
    Timecop.freeze(1.day.ago) { sign_up_user }
    open_email "kingdaphnes@loz.com"
    current_email.click_link "this link"

    expect(page).to have_content "That link has expired. Please try signing in again."
  end

  scenario "a user tries to sign up with an email that's already in the database" do
    sign_up_user
    sign_up_user

    expect(page).to have_content "Email has already been taken."
  end

  scenario "a user tries to sign up with a poorly-formatted email" do
    visit root_path
    fill_in "Full name", with: "Hand in the Toilet"
    
    fill_in "Email", with: "hand"
    click_on "Schedule a free consultation"
    expect(page).to have_content "Email was invalid."

    fill_in "Email", with: "hand@"
    click_on "Schedule a free consultation"
    expect(page).to have_content "Email was invalid."

    fill_in "Email", with: "hand.com"
    click_on "Schedule a free consultation"
    expect(page).to have_content "Email was invalid."
  end

  scenario "a user wants to sign in to an existing account" do
    visit root_path
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

  scenario "a user tries to sign in with an email that is not in the database" do
    visit new_session_path
    fill_in "Email", with: "midna@loz.com"
    click_on "Sign back in"

    expect(page).to have_content "We could not find record of that email. Please try again or sign up first."
  end
end
