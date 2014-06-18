class Review < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates :remark, length: { minimum: 4 }

  STARS = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  validates :stars, inclusion: {
    in: STARS,
    message: "must be between 1 and 9"
  }
end
