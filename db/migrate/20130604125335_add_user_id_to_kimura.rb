class AddUserIdToKimura < ActiveRecord::Migration
  def change
    add_column :kimuras, :user_id, :integer
  end
end
