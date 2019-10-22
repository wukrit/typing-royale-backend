class CreateUserChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :user_challenges do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :challenge, null: false, foreign_key: true
      t.float :wpm
      t.timestamps
    end
  end
end
