class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :kimura
      t.text :body

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :kimura_id
  end
end
