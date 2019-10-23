class AddWinnerNameColumnToChallenges < ActiveRecord::Migration[6.0]
  def change
    add_column :challenges, :winner_name, :string
  end
end
