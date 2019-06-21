require "rails_helper"

feature "landing" do
  scenario "a user visits the landing page" do
    visit root_path
    expect(page).to have_content "Sign up below if you are interested in a free introductory consultation."
  end

  scenario "a user wants to set up a consultation" do
    visit root_path
    fill_in "Full name", with: "John Smith"
    fill_in "Email", with: "john.smith@example.com"
    # check "Keep me up to date with the latest news about Novum Opus."
    click_on "Schedule a consultation"

    # expect(mail.count).to eq 1
    # in email, click "verify"
    # ensure user is signed in through session storage

    # Select date
    # Select time
    # Select location, or specify one
  end
end
