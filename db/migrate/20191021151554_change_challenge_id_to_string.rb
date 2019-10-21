class ChangeChallengeIdToString < ActiveRecord::Migration[6.0]
  def change
    change_column :challenges, :id, :string
  end
end
