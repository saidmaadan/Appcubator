class MakeCheckinsAJoinTable < ActiveRecord::Migration
  def up
    Checkin.delete_all
    remove_column :checkins, :name
    remove_column :checkins, :email
    add_column    :checkins, :user_id, :integer
  end

  def down
    Checkin.delete_all
    remove_column :checkins, :user_id
    add_column    :checkins, :name,  :string
    add_column    :checkins, :email,  :string
  end
end
