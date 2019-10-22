class RemoveColumnsFromChallenge < ActiveRecord::Migration[6.0]
  def change
    remove_column :challenges, :user_id 
    remove_column :challenges, :wpm
  end
end
