require 'rails_helper'

RSpec.describe ReviewsController, :type => :controller do

  describe "A review" do

  it "belongs to a project" do
    project = Project.create(project_attributes)

    review = project.reviews.new(review_attributes)

    expect(review.project).to eq(project)
  end

  it "with example attributes is valid" do
    review = Review.new(review_attributes)

    expect(review.valid?).to be_true
  end

  it "requires a name" do
    review = Review.new(name: "")

    review.valid?

    expect(review.errors[:name].any?).to be_true
  end

  it "requires a remark" do
    review = Review.new(remark: "")

    review.valid?

    expect(review.errors[:remark].any?).to be_true
  end

  it "requires a remark over 3 characters" do
    review = Review.new(remark: "X" * 3)

    review.valid?

    expect(review.errors[:remark].any?).to be_true
  end

  it "accepts star values of 1 through 5" do
    stars = [1, 2, 3, 4, 5]
    stars.each do |star|
      review = Review.new(stars: star)

      review.valid?

      expect(review.errors[:stars].any?).to be_false
  end

  it "rejects invalid star values" do
    stars = [-1, 0, 6]
    stars.each do |star|
      review = Review.new(stars: star)

      review.valid?

      expect(review.errors[:stars].any?).to be_true
      expect(review.errors[:stars].first).to eq("must be between 1 and 5")
    end
  end

  describe "Viewing a list of reviews" do

    it "shows the reviews for a specific project" do
      project1 = Project.create(project_attributes(name: "Restaurant Locator"))
      review1 = project1.reviews.create(review_attributes(name: "Said M"))
      review2 = project1.reviews.create(review_attributes(name: "Greg G"))


      project2 = Project.create(project_attributes(name: "Simplified browsing."))
      review3 = project2.reviews.create(review_attributes(name: "Mikeal Peter"))

      visit project_reviews_url(project1)

      expect(page).to have_text(review1.name)
      expect(page).to have_text(review2.name)
      expect(page).not_to have_text(review3.name)
    end
  end

  describe "Creating a new review" do
    it "saves the review" do
      project = Project.create(project_attributes)

      visit project_url(project)

      click_link 'Write Review'

      expect(current_path).to eq(new_project_review_path(project))

      fill_in "Name", with: "Said M"
      choose "review_stars_3"
      # select 3, :from => "review_stars" => select option
      fill_in "remark", with: "One of the best web app of 2014"

      click_button 'Post Review'

      expect(current_path).to eq(project_reviews_path(project))

      expect(page).to have_text("Thanks for your review!")
    end

    it "does not save the review if it's invalid" do
      project = Project.create(project_attributes)

      visit new_project_review_url(project)

      expect {
        click_button 'Post Review'
      }.not_to change(Review, :count)

      expect(page).to have_text('error')
    end
  end

  describe 'average number of review stars' do

    it "calculates the average number of review stars" do
      project = Project.create(project_attributes)

      project.reviews.create(review_attributes(stars: 1))
      project.reviews.create(review_attributes(stars: 3))
      project.reviews.create(review_attributes(stars: 5))

      expect(project.average_stars).to eq(3)
    end
  end
end

