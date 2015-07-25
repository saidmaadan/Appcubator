class Project < ActiveRecord::Base
  belongs_to :user

  # has_secure_password
  # include Dateable
  extend ActionView::Helpers::DateHelper
  # extend FriendlyId
  # friendly_id :slug_candidates, use: :slugged

  has_attached_file :screenshot, styles: {
    :small => "200x150>", :medium => "300x300>",
    :large => "500x500>", :thumb => "100x100>"
  }, #:default_url => "/:style/mks7.jpg"

  :storage => :s3,
    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
    validates_attachment_content_type :screenshot, :content_type => /\Aimage\/.*\Z/

  def s3_credentials
     {
        :bucket => ENV['AWS_BUCKET'],
        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }
  end

  #validates_attachment_content_type :screenshot, :content_type => /\Aimage\/.*\Z/
  validates :name, :teams, presence: true
  validates :description, length: { minimum: 25 }
  #validates :target_amount, numericality: { greater_than_or_equal_to: 0 }

  LOOKING_FOR = ['Partnership', 'Investor', 'Buyer', 'Other']
  #validates :looking_for, inclusion: { in: LOOKING_FOR }

  has_many :reviews, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :followers, through: :follows, source: :user
  paginates_per 6

  def to_param
    # "#{id}"
     "#{id}-#{name.parameterize}"
  end

  # def slug_candidates
  #   [
  #     :name,
  #     [:name, :teams],
  #     [:name, :teams, :looking_for,],
  #     [:name, :teams, :looking_for, :web_url],
  #     [:name, :teams, :looking_for, :web_url, :target_amount]
  #   ]
  # end

  #  def has_friendly_id_slug?
  #   slugs.where(slug: slug).exists?
  # end

  # def should_generate_new_friendly_id?
  #   new_record?
  # end

  #  def self.search(search)
  #   if search
  #     where(["name LIKE ?", "%#{params[:search]}%"])
  #   else
  #     recent
  #   end
  # end

 

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
