class AddPlayersToChallenges < ActiveRecord::Migration[6.0]
  def change
    add_column :challenges, :player_one, :bigint
    add_column :challenges, :player_two, :bigint
    add_column :challenges, :player_three, :bigint
    add_column :challenges, :player_four, :bigint
  end
end
