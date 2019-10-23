class AddWpmColumnsToChallenges < ActiveRecord::Migration[6.0]
  def change
    add_column :challenges, :player_one_wpm, :float
    add_column :challenges, :player_two_wpm, :float
    add_column :challenges, :player_three_wpm, :float
    add_column :challenges, :player_four_wpm, :float
  end
end
