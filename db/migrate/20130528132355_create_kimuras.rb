class CreateKimuras < ActiveRecord::Migration
  def change
    create_table :kimuras do |t|
      t.integer :kimura_page
      t.string :kimura_column
      t.integer :kimura_lemma
      t.string :kimura_reading
      t.string :kimura_wadoku_candidates
      t.boolean :kimura_isEdited
      t.boolean :kimura_hasCandidates

      t.timestamps
    end
  end
end
