class AddTranslationToWadokus < ActiveRecord::Migration
  def change
    add_column :wadokus, :translation, :text
  end
end
