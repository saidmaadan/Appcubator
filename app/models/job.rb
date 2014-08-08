class Job < ActiveRecord::Base
	belongs_to :user

	has_attached_file :logo, styles: {
    :small => "200x150>", :medium => "300x300>",
    :large => "500x500>", :thumb => "100x100>"
  }, #:default_url => "/:style/mks7.jpg"

  :storage => :s3,
    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
    validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  def s3_credentials
     {
        :bucket => ENV['AWS_BUCKET'],
        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }
  end

  validates :job_title, :experience, :employment_type, :location, 
  :state, :country, :application_link, presence: true
  validates :job_details, length: { minimum: 25 }

  INDUSTRY = ['Accounting', 'Airlines/Aviation', "Alternative Disputs Resolution", "Alternative Medicine", "Animation", "Apparel & Fashion", 
    "Architecture & Planning", "Arts & Crafts", "Automotive", "Banking", "Biotechnology", "Broadcast Media", "Building Materials", "Capital Markets", "Commercial Real Estate",
   "Computer Software", "Computer hardware & Network Security", "Construction", 'Consumer Electronics', 'Consumer Services', "Dairy", "Education Management", "E-Learning", "Entertainment", "Information Technology and Services",
   "Hospital & Health Care", "Import and Export", "Internet", "Government", "Legal", "Management Consulting", "Marketing and Advertising", "Military", "Nonprofit Organization Management",
   "Oil & Energy","Professional Training & Coaching", "Restaurants", "Research", "Security and Investigations", "Sports", "Staffing and Recruiting", "Transportation", "Venture Capital & Private Equity", "Other"]
  #validates :sex, inclusion: { in: SEX }

  EXPERIENCE = ['Internship', 'Entry-level', 'Mid-level', 'Senior-level', "Associate", "Executive", "Director", "CEO", "Not Applicable"]
  EMPLOYMENT_TYPE = ['Full Time', 'Part Time', 'Contract', 'Contract', "Contract to Hire", "Temporary", "Other"]
  EXPERIENCE = ['Internship', 'Entry-level', 'Mid-level', 'Senior-level', "Associate", "Executive", "Director", "CEO", "Not Applicable"]
  SALARY_RATE = ['Hourly', 'Weekly', 'Monthly', 'Annually']
  RELOCATION = ['NO', '0 - 20%', '20 - 40%', '40 - 60%', '60 - 80%', "80 - 100%"]
  REQUIRED_TRAVEL = ["NO", '0 - 20%', '20 - 40%', '40 - 60%', '60 - 80%', "80 - 100%"]
  COMPANY_SIZE = ["1 - 10 Employees", "11 - 50 Employees", "51 - 100 Employees", "101 - 200 Employees", "201 - 500 Employees", "501 - 1000 Employees", "1001 - 5000 Employees", "5000+ Employees"]
  paginates_per 3

  def to_param
    "#{id}-#{job_title.parameterize}"
  end

  def self.recent
    order("created_at desc")
  end
end
