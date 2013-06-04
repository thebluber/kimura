class Kimura < ActiveRecord::Base
  attr_accessible :kimura_column, :kimura_hasCandidates, :kimura_isEdited, :kimura_lemma, :kimura_page, :kimura_reading, :kimura_wadoku_candidates, :kimura_writing
  belongs_to :user
  belongs_to :wadoku
end
