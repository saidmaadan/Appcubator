class Checkin < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user

  validates :comment, length: { minimum: 10 }


  SKILLS = [
    'Full Stack Developer',
    'Front End Developer',
    'BackEnd Developer',
    'Ruby on Rails Developer',
    'Javascript Developer',
    'Java Developer',
    'Python Developer',
    'PHP Developer',
    'UI Developer',
    'Web Designer',
    'Other'
  ]
  validates :skills, inclusion: {in: SKILLS}

  POSITION = ['Full Time', 'Part Time']
  validates :position, inclusion: {in: POSITION}

  validates :skills, inclusion: {in: SKILLS}

  EXPERIENCE = [1, 2, 3,4,5,6,7,8,9]

  validates :experience, inclusion: {
    in: EXPERIENCE, message: "Select your year(s) of experience"}

end
