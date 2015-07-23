class User < ActiveRecord::Base
  has_secure_password
  searchkick
  
  extend FriendlyId
  friendly_id :username, use: :slugged


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
  before_create {generate_token(:auth_token)}

  has_many :projects, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :checkins, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :followed_projects, through: :follows, source: :project
  has_many :associations, dependent: :destroy
  has_many :abilities, through: :associations
  has_many :votes, dependent: :destroy
  has_many :voted_ideas, through: :votes, source: :idea
  has_many :trends, dependent: :destroy
  has_many :jobs

  paginates_per 20

  # def should_generate_new_friendly_id?
  #   new_record?
  # end

  # def to_param
  #   slug
  #   # "#{id}?000/#{username}"
  #   # "#{id}-#{name.parameterize}"
  # end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def self.search(search)
    if search
      where(["name LIKE ?", "%#{search}%"])
    else
      all
    end
  end

  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end

  def self.authenticate(email_or_username, password)
    user = User.find_by(email: email_or_username) || User.find_by(username: email_or_username)
    user && user.authenticate(password)
  end
end
