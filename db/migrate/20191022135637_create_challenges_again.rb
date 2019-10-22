class CreateChallengesAgain < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.belongs_to :prompt, null: false, foreign_key: true
      t.string :uuid
      t.bigint :winner_id
    end
  end
end
