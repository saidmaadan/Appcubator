require 'rails_helper'

RSpec.describe IdeasController, :type => :controller do

  describe "Creating a new idea post" do
    it "saves the post and shows the new idea-post's details" do
      visit ideas_url

      click_link 'Post New Idea'

      expect(current_path).to eq(new_idea_path)

      fill_in "idea_title", with: "Social Network"
      fill_in "idea_description", with: "Private social network for family"
      fill_in "idea_goal", with: "Looking for developer to work on this project"
      fill_in "idea_category", with: "Mobile App"
      fill_in "idea_market", with: "Global"


      click_button 'Create Idea'

      expect(current_path).to eq(idea_path(Idea.last))

      expect(page).to have_text('New Idea Name')
      expect(page).to have_text('Post successfully created!')
    end

      it "does not save the post if it's invalid" do
      visit new_idea_url

      expect {
        click_button 'Create Post'
      }.not_to change(Idea, :count)

      expect(page).to have_text('error')
    end
  end

  describe "Deleting post" do
    it "destroys the post and shows the idea posting page" do
      idea = Idea.create(idea_attributes)

      visit idea_path(idea)

      click_link 'Delete'

      expect(current_path).to eq(ideas_path)
      expect(page).not_to have_text(idea.name)
      expect(page).to have_text('Post successfully deleted!')
    end
  end

  describe "Editing Idea Post" do

    it "updates the post and shows the post's updated details" do
      idea = Idea.create(idea_attributes)

      visit idea_url(idea)

      click_link 'Edit'

      expect(current_path).to eq(edit_idea_path(idea))

      expect(find_field('event_title').value).to eq(event.title)

      fill_in "Title", with: "Updated Event Title"

      click_button "Update Idea Post"

      expect(current_path).to eq(idea_path(idea))

      expect(page).to have_text("Updated Idea Post Title")
      expect(page).to have_text('Post successfully updated!')
    end

    it "does not update the post if it's invalid" do
      idea = Idea.create(idea_attributes)

      visit edit_idea_url(idea)

      fill_in 'Title', with: " "

      click_button 'Update Idea Post'

      expect(page).to have_text('error')
    end
  end

  describe "Viewing an individual post" do

  it "shows the idea's details" do
    idea = Idea.create(idea_attributes)

    visit idea_url(idea)

    expect(page).to have_text(idea.title)
    expect(page).to have_text(idea.description)
    expect(page).to have_text(idea.goal)
    expect(page).to have_text(idea.market)
  end
end

# --Model Test --

describe "Post Idea" do


  it "requires a title" do
    idea = Idea.new(title: "")

    expect(idea.valid?).to be_false
    expect(idea.errors[:title].any?).to be_true
  end

  it "requires a description" do
    idea = Idea.new(description: "")

    expect(idea.valid?).to be_false
    expect(idea.errors[:description].any?).to be_true
  end

  it "requires to set the goal" do
    idea = Idea.new(goal: "")

    expect(idea.valid?).to be_false
    expect(idea.errors[:goal].any?).to be_true
  end

  it "requires a description over 24 characters" do
    idea = Idea.new(description: "X" * 24)

    expect(event.valid?).to be_false
    expect(event.errors[:description].any?).to be_true
  end

  it "with example attributes is valid" do
    idea = Idea.new(idea_attributes)

    expect(idea.valid?).to be_true
  end
end

end
