class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :student
      t.string :kimura
      t.string :wadoku

      t.timestamps
    end
  end
end
