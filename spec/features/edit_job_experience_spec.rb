require "rails_helper"

feature "edit job experience" do
  let(:user) { create :user }
  let!(:job_experience) { create :job_experience, creator_id: user.id }

  scenario "a user updates a job experience they own" do
    page.set_rack_session email: user.email
    visit root_path
    expect(page).to have_content(job_experience.company)

    click_on "Update"
    expect(page).to have_content "Update Your Job Experience"

    fill_in "Position", with: "Cashier"
    fill_in "Company", with: "Super Target"
    fill_in "City", with: "Fort Collins"
    fill_in "State", with: "CO"
    fill_in "Experience", with: "Cashiering is pretty exhausting. Customers love to complain to cashiers, so you'll be hearing a lot of that. Plus, it doesn't pay much."
    fill_in "Pay", with: "I worked at Super Target in 2010, so the pay went from $8/hour to $8.10/hour while I was there. It's probably slightly better now, but not by much."
    fill_in "Recommendation", with: "Unless you desperately need a job, I would not recommend working at Super Target."
    fill_in "Website", with: "www.target.com"
    click_on "Update"
    expect(page).to have_content("Your experience has been updated.")
    expect(page).to have_content("Super Target")
  end
end
