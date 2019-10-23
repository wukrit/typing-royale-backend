class AddPlayerProgressToChallenges < ActiveRecord::Migration[6.0]
  def change
    add_column :challenges, :player_one_progress, :integer
    add_column :challenges, :player_two_progress, :integer
    add_column :challenges, :player_three_progress, :integer
    add_column :challenges, :player_four_progress, :integer
  end
end
