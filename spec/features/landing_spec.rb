require "rails_helper"

feature "landing" do
  scenario "a user visits the landing page" do
    visit root_path
    expect(page).to have_content "Novum Opus"
  end
end
