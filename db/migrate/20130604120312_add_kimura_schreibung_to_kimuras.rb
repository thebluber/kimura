class AddKimuraSchreibungToKimuras < ActiveRecord::Migration
  def change
    add_column :kimuras, :kimura_schreibung, :text
  end
end
