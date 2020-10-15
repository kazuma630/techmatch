class RenameGenreColumnToDetails < ActiveRecord::Migration[6.0]
  def change
    rename_column :details, :genre, :genre_id
  end
end
