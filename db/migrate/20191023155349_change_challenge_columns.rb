class ChangeChallengeColumns < ActiveRecord::Migration[6.0]
  def change
    change_column :challenges, :player_one, :string
    change_column :challenges, :player_two, :string
    change_column :challenges, :player_three, :string
    change_column :challenges, :player_four, :string    
  end
end
