class RenameLanguageColumnToDetails < ActiveRecord::Migration[6.0]
  def change
    rename_column :details, :language, :language_id
  end
end
