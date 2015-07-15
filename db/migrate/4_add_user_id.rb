class AddUserId < ActiveRecord::Migration
  def change
    add_column :tracks, :user_id, :integer
    add_foreign_key :tracks, :users
  end
end