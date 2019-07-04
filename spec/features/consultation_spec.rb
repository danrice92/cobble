require "rails_helper"

feature "scheduling a consultation" do
  let(:user) { create :user }

    sign_in user
    visit new_consultation_path
    within_frame find("iframe") do
      expect(page).to have_content "Consultation"
    end
  end
end
