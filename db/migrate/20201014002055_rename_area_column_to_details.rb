class RenameAreaColumnToDetails < ActiveRecord::Migration[6.0]
  def change
    rename_column :details, :area, :area_id
  end
end
