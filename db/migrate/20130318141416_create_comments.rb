class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :Recipe
      t.string :commenter
      t.string :body

      t.timestamps
    end
  end
end
