class CreateDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :details do |t|
      t.integer :age,         null: false
      t.integer :area,        null: false
      t.integer :occupation,  null: false
      t.string :school
      t.integer :experience
      t.integer :language,    null: false
      t.text :pr,             null: false
      t.references :user,     foreign_key: true
      t.timestamps
    end
  end
end
