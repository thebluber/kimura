class CreateWadokus < ActiveRecord::Migration
  def change
    create_table :wadokus do |t|
      t.string :entry
      t.text :contents

      t.timestamps
    end
  end
end
