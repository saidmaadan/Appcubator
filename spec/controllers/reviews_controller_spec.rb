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
end

end
