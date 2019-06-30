require "rails_helper"

feature "scheduling a consultation" do
  let(:user) { create :user }

  scenario "a user with a verified email wants to schedule a consultation", js: true do
    sign_in user
    visit root_path
    within_frame find("iframe") do
      expect(page).to have_content "Consultation"
    end
  end
end
