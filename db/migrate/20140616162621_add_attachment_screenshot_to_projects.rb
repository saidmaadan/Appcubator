class AddAttachmentScreenshotToProjects < ActiveRecord::Migration
  def change
    # change_table :projects do |t|
    #   t.attachment :projects, :screenshot
    # end
    add_attachment :projects, :screenshot
    remove_column :projects, :image_file, :string
  end
end
