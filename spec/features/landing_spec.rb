require "rails_helper"

feature "landing" do
  scenario "a user is not logged in" do
    visit root_path
    expect(page).to have_content "Novum Opus"
  end
end
