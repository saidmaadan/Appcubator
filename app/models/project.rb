class Project < ActiveRecord::Base

  has_attached_file :screenshot, styles: {
    :small => "200x200>", :medium => "300x300>",
    :large => "500x500>", :thumb => "100x100>"
  }, :default_url => "/:style/mks7.jpg"

  validates_attachment_content_type :screenshot, :content_type => /\Aimage\/.*\Z/
  validates :name, :looking_for, :teams, presence: true
  validates :description, length: { minimum: 25 }
  validates :target_amount, numericality: { greater_than_or_equal_to: 0 }

  LOOKING_FOR = ['Partnership', 'Investor', 'Buyer']

  has_many :reviews, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :followers, through: :follows, source: :user






  def self.recent
    order("created_at desc")
  end

  def average_stars
    reviews.average(:stars)
  end

  def recent_reviews
    reviews.order('created_at desc').limit(2)
  end
end
