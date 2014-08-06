class Trend < ActiveRecord::Base
	belongs_to :user

	has_attached_file :upload, styles: {
    :small => "200x150>", :medium => "300x300>",
    :large => "500x500>", :thumb => "100x100>"
  }, #:default_url => "/:style/mks7.jpg"

  :storage => :s3,
    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
    validates_attachment_content_type :upload, :content_type => /\Aimage\/.*\Z/

  def s3_credentials
     {
        :bucket => ENV['AWS_BUCKET'],
        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }
  end

  validates :title, presence: true
  validates :content, length: { minimum: 25 }

  paginates_per 2

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def self.recent
    order("created_at desc")
  end
end
