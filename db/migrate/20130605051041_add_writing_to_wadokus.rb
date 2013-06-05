class AddWritingToWadokus < ActiveRecord::Migration
  def change
    add_column :wadokus, :writing, :string
  end
end
