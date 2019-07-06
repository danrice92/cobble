require "rails_helper"

feature "landing" do
  let(:user) { create :user }

  scenario "a user is not signed in and visits the landing page" do
    visit root_path
    expect(page).to have_content "Sign up below to schedule a free introductory consultation."
    expect(page).to have_content "Sign in"
  end

  scenario "a user is signed in and visits the landing page" do
    sign_in user
    visit root_path
    expect(page).to have_content "Sign out"
  end
end
