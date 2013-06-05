class AddReadingToWadokus < ActiveRecord::Migration
  def change
    add_column :wadokus, :reading, :string
  end
end
