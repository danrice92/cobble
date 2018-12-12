require "rails_helper"

feature "landing" do
  let!(:job_experience) { create :job_experience }

  scenario "a user is not logged in" do
    visit root_path
    expect(page).to have_content "Novum Opus is a social platform that allows peers to share career advice."
  end

  scenario "viewing a JobExperience on the landing page" do
    visit root_path
    expect(page).to have_content "#{job_experience.position} at #{job_experience.company}"
  end
end
