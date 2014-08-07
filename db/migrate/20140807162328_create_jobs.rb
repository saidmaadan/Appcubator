class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :job_title
      t.text :job_details
      t.string :experience
      t.string :employment_type
      t.text :desire_skill
      t.string :location
      t.string :state
      t.string :country
      t.string :zip_code
      t.string :salary
      t.string :other_pay
      t.string :relocation
      t.string :required_travel
      t.string :company_name
      t.text :company_description
      t.string :website
      t.string :application_link
      t.text :key_responsibility
      t.attachment :logo
      t.string :industry
      t.string :company_size
      t.string :salary_rate
      t.integer :user_id

      t.timestamps
    end
  end
end
