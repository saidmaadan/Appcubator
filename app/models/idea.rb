class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :checkins, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, source: :user


  validates :title, presence: true

  validates :description, length: { minimum: 25 }
 
  CATEGORY = ['WEB APP', 'MOBILE APP', "IOS", "ANDROID", "BLACKBERRY", "ANDROID, WINDOW APP, IOS", "ALL PLATFORMS"]
   #validates :category, inclusion: { in: CATEGORY }

   MARKET = ['GLOBAL MARKET', 'US MARKET', "EUROPEAN MARKET", "AFRICAN MARKET ", "ASIAN MARKET", "OTHER"]
   #validates :market, inclusion: { in: MARKET }

   GOAL = ['FREE STATRTUP IDEA POST', 'LOOKING FOR DEVELOPER TO WORK ON THIS PROJECT', 'PARTNERSHIP TO WORK ON THIS IDEA', "OTHER"]
   #validates :market, inclusion: { in: MARKET }

  # scope :recent, -> { where('start_at < ?', Time.now).order("created_at desc") }
  # scope :webapp, -> { recent.where(category: 'WEB APP')}
  # scope :mobileapp, -> { recent.where(category: 'MOBILE APP')}
  # scope :android, -> { recent.where(category: 'ANDROID APP')}
  # scope :ios, -> { recent.where(category: 'IOS APP')}
paginates_per 6

def to_param
    "#{id}-#{title.parameterize}"
  end
def self.recent
    order("created_at desc")
  end
end

