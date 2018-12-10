require "rails_helper"

feature "landing" do
  scenario "a user is not logged in" do
    visit root_path
    expect(page).to have_content "Novum Opus is a social platform that allows peers to share career advice."
  end

  scenario "viewing a JobExperience on the landing page" do
  end
end
