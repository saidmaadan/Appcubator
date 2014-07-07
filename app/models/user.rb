class User < ActiveRecord::Base
  has_secure_password
  validates :password, length: { minimum: 8, allow_blank: true }

  validates :name, presence: true
  validates :email, presence: true,
                  format: /\A\S+@\S+\z/,
                  uniqueness: { case_sensitive: false }

  validates :username, presence: true,
                     format: /\A[A-Z0-9]+\z/i,
                     uniqueness: { case_sensitive: false }

  SEX = ['Male', 'Female', "I'll rather not say"]
  #validates :sex, inclusion: { in: SEX }

  MARITAL = ['Single', 'Married', 'Divorced', "I'll rather not say"]
  #validates :marital_status, inclusion: { in: MARITAL_STATUS }

  has_many :reviews, dependent: :destroy
  has_many :checkins, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :followed_projects, through: :follows, source: :project
  has_many :associations, dependent: :destroy
  has_many :abilities, through: :associations
  has_many :votes, dependent: :destroy
  has_many :voted_ideas, through: :votes, source: :idea

  
  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end

  def self.authenticate(email_or_username, password)
    user = User.find_by(email: email_or_username) || User.find_by(username: email_or_username)
    user && user.authenticate(password)
  end
end
