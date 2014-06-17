class Checkin < ActiveRecord::Base
  belongs_to :idea

  validates :name, :skills, :position, presence: true
  # validates :email

  validates :comment, length: { minimum: 10 }

  EXPERIENCE = ['1 - 2 years', '3 - 5 years', '6 - 8  years', '8 - 12 years' ]

  validates :experience, inclusion: {
    in: EXPERIENCE,
    message: "Select your year(s) of experience"
  }

end
