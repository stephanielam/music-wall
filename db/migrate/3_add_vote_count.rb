class AddVoteCount < ActiveRecord::Migration
  def change
    add_column :tracks, :votes, :integer
  end
end