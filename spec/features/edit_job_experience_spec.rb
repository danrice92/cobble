require "rails_helper"

feature "edit job experience" do
  let(:user) { create :user }
  let(:the_other_guy) { create :user }
  let!(:job_experience) { create :job_experience, creator_id: user.id }

  scenario "a user updates a job experience they own" do
    sign_in user
    visit root_path
    expect(page).to have_content(job_experience.company)
    click_on "Edit"
    expect(page).to have_content "Edit This Job Experience"

    fill_in "Position", with: "Cashier"
    fill_in "Company", with: "Super Target"
    fill_in "Experience", with: "Cashiering is pretty exhausting. Customers love to complain to cashiers, so you'll be hearing a lot of that. Plus, it doesn't pay much."
    fill_in "Pay", with: "I worked at Super Target in 2010, so the pay went from $8/hour to $8.10/hour while I was there. It's probably slightly better now, but not by much."
    click_on "Update"
    expect(page).to have_content("This experience has been updated.")
    expect(page).to have_content("Super Target")
    expect(job_experience.reload.creator).to eq(user)
  end

  scenario "a user updates a job experience they don't own" do
    sign_in the_other_guy
    visit root_path
    click_on "Edit"
    expect(page).to have_content "Edit This Job Experience"

    fill_in "Pay", with: "Cashiering at Target now pays $12/hour."
    click_on "Update"
    expect(page).to have_content("This experience has been updated.")
    expect(page).to have_content("Cashiering at Target now pays $12/hour.")
    expect(job_experience.reload.creator).to eq(user)
  end

  scenario "a user is not signed in and tries to update a job experience" do
    visit root_path
    expect(page).to_not have_content "Edit"
    visit edit_job_experience_path job_experience
    expect(page).to have_content "You are not authorized to perform this action."
  end
end
