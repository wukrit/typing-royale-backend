class CreatePrompts < ActiveRecord::Migration[6.0]
  def change
    create_table :prompts do |t|
      t.text :text
      t.integer :length

      t.timestamps
    end
  end
end
