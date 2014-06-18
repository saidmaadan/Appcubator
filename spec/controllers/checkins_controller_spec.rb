require 'rails_helper'

RSpec.describe CheckinsController, :type => :controller do

  describe "Viewing a list of checkins" do

  it "shows the checkins for a specific idea post" do
    idea1 = Idea.create(idea_attributes(title: "Dating App"))
    checkin1 = idea1.checkins.create(checkin_attributes(name: "Greg Groove"))
    checkin2 = idea1.checkis.create(checkin_attributes(name: "Randy T"))


    idea2 = Idea.create(idea_attributes(title: "eLearning App"))
    checkin3 = idea2.checkins.create(checkin_attributes(name: "Zack Spector"))

    visit idea_checkins_url(idea1)

    expect(page).to have_text(checkin1.name)
    expect(page).to have_text(checkin2.name)
    expect(page).not_to have_text(checkin3.name)
  end
end

describe "Creating a checkin" do
  it "saves the checkin" do
    idea = Idea.create(idea_attributes)

    visit idea_url(idea)

    click_link 'Apply to Check-In'

    expect(current_path).to eq(new_idea_checkin_path(idea))

    fill_in "Name", with: "Akeem M"
    fill_in "Email", with: "akeem@akeem.com"

    fill_in "Comment", with: "Wish to learn more!"

    click_button 'Check-In'

    expect(current_path).to eq(idea_checkins_path(idea))

    expect(page).to have_text("You are successfully check-in!")
  end

  it "does not save the check-in if it's invalid" do
    idea = Idea.create(idea_attributes)

    visit new_idea_checkin_url(idea)

    expect {
      click_button 'Check-In'
    }.not_to change(Checkin, :count)

    expect(page).to have_text('error')
  end
end

end
