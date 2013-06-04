class AddWritingToKimura < ActiveRecord::Migration
  def change
    add_column :kimuras, :kimura_writing, :string
  end
end
