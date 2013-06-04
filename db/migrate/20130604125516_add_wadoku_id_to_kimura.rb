class AddWadokuIdToKimura < ActiveRecord::Migration
  def change
    add_column :kimuras, :wadoku_id, :integer
  end
end
