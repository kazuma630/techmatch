class RenameOccupationColumnToDetails < ActiveRecord::Migration[6.0]
  def change
    rename_column :details, :occupation, :occupation_id
  end
end
