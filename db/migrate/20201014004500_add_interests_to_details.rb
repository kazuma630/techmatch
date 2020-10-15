class AddInterestsToDetails < ActiveRecord::Migration[6.0]
  def change
    add_column :details, :interest_id, :integer
  end
end