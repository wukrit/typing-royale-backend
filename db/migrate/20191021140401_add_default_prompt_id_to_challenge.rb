class AddDefaultPromptIdToChallenge < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:challenges, :prompt_id, Prompt.all.sample.id)
  end
end
