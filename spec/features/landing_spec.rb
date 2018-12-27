require "rails_helper"

feature "landing" do
  let!(:job_experience) { create :job_experience }
  let(:user) { create :user }

  scenario "a user is not logged in" do
    visit root_path
    expect(page).to have_content "Sign Up"
  end

  scenario "a user is logged in" do
    page.set_rack_session email: user.email
    visit root_path
    expect(page).to have_content "Sign Out"
  end

  scenario "viewing a JobExperience on the landing page" do
    visit root_path
    expect(page).to have_content "#{job_experience.position} at #{job_experience.company}"
  end
end
