require "rails_helper"

feature "new job experience", js: true do
  scenario "a user creates a job experience" do
    visit root_path
    click_on "Share your experience"
    expect(page).to have_content "Create a job experience"

    fill_in "Position", with: "Retail Sales Associate"
    fill_in "Company", with: "T-Mobile"
    fill_in "City", with: "Greeley"
    fill_in "State", with: "CO"
    fill_in "Experience", with: "T-Mobile was a decent experience for a retail job. They know you're going to be putting up with a lot of crazy customers, so they pay you pretty well for it given that it's a job just about anyone can do. The pay and benefits are solid for the industry, but professionals will probably be frustrated by the incompetence of their coworkers, who are often young and inexperienced. There is a general brattiness to the store I worked at- the management likes to coast on the easy sales, and the employees follow suit. Probably the most frustrating thing about the job was that upper management outside of the store kept pushing us to sell products customers generally didn't come in for (like cheap tablets, SyncUp Drives, and Nest alarms), when our particular branch mostly served people who had very little spending money. It felt immoral to me to hear a customer say they had $50 to their name and suggest to them they spend $48 of it on a SyncUp Drive activation. But of course, quotas come first!\nIn general, T-Mobile is trying harder than its competitors to do right by customers and get them better value, but I'd like to see the company move away from upselling junk that no one wants in the future."
    fill_in "Pay", with: "I started as a part-time employee, which paid about $30,000/year, and left as a full-time employee, which paid about $50,000/year. I started at about $10/hour plus commission, got a pay bump about a year in, and then got a raise to $13/hour in my last year (I don't know if they gave raises to all of the sales associates or were just reacting to Colorado raising its minimum wage). The commission was more than half of the pay, though. It encourages employees to activate service and sell specific promotional devices (the cheap tablets and such that I mentioned before), and practically discourages selling phones at this point. It was somewhat frustrating that they seem to change the commission structure every few months, so it is good to have some other income source, like a side job or a spouse's income, to offset the fluctuations that happen once in a while.\nT-Mobile also offers a 401(k) and shares of company stock, even to the sales associates, which was a nice perk."
    fill_in "Recommendation", with: "I would definitely encourage people to find a more skilled job than T-Mobile if they can so they don't have to deal with customers complaining about their phone bills, but as jobs in the retail and food service industries go, T-Mobile was definitely the best of the many I've worked. For an entry-level job that does not require a degree, the pay is fairly generous and the benefits are unusually good. If you love the company, you can probably find some opportunities to get promoted, but for many young people it could also be a great way to pay the bills until they can qualify for a more skilled position."
    fill_in "Website", with: "www.t-mobile.com"
    click_on "Submit"
    expect(page).to have_content("Your experience was successfully created")
  end
end
