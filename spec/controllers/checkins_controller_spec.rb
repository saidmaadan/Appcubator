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

end
