require "rails_helper"

feature "new job experience" do
  scenario "a user creates a job experience" do
    visit root_path
    click_on "Share Your Experience"
    expect(page).to have_content "New Job Experience"

    fill_in "Position", with: "Retail Sales Associate"
    fill_in "Company", with: "T-Mobile"
    fill_in "City", with: "Greeley"
    fill_in "State", with: "CO"
    fill_in "Experience", with: "T-Mobile was a good experience for a retail job, but it still requires dealing with cranky customers and whiny coworkers."
    fill_in "Pay", with: "I went from being paid $30k/year part time to $50k/year full time in the time I worked at T-Mobile."
    fill_in "Recommendation", with: "It's a great place to work if you need a job or to pay the bills through college, but I wouldn't build a long-term career in T-Mobile retail."
    fill_in "Website", with: "www.t-mobile.com"
    click_on "Submit"
    expect(page).to have_content("Your experience has been saved")
  end
end
