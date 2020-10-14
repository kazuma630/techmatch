class RenameExperienceColumnToDetails < ActiveRecord::Migration[6.0]
  def change
    rename_column :details, :experience, :experience_id
  end
end
