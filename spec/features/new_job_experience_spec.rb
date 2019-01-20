require "rails_helper"

feature "new job experience" do
  let(:user) { create :user }

  scenario "a signed-in user creates a job experience" do
    sign_in user
    visit root_path

    click_on "Share"
    expect(page).to have_content "Share Your Job Experience"

    fill_in "Position", with: "Retail Sales Associate"
    fill_in "Company", with: "T-Mobile"
    fill_in "City", with: "Greeley"
    select "CO", from: "job_experience[state]"
    fill_in "Experience", with: "T-Mobile was a good experience for a retail job, but it still requires dealing with cranky customers and whiny coworkers."
    fill_in "Pay", with: "I went from being paid $30k/year part time to $50k/year full time in the time I worked at T-Mobile."
    fill_in "Recommendation", with: "It's a great place to work if you need a job or to pay the bills through college, but I wouldn't build a long-term career in T-Mobile retail."
    fill_in "Website", with: "www.t-mobile.com"
    click_on "Submit"
    expect(page).to have_content("Your experience has been saved.")
    expect(page).to have_content("T-Mobile")
    expect(page).to have_content("Created by #{user.first_name} #{user.last_name}")
    expect(page).to have_content("Collaborators: #{user.first_name} #{user.last_name}")
  end

  scenario "a user is not signed in and tries to create a job experience" do
    visit root_path
    expect(page).to_not have_content "Share"
    visit new_job_experience_path
    expect(page).to have_content "You are not authorized to perform this action."
  end
end
