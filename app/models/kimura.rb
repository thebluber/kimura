class Kimura < ActiveRecord::Base
  attr_accessible :kimura_column, :kimura_hasCandidates, :kimura_isEdited, :kimura_lemma, :kimura_page, :kimura_reading, :kimura_wadoku_candidates, :kimura_writing
  belongs_to :user
  belongs_to :wadoku
  has_many :comments

  before_save :check_edited

  private

  def check_edited
    self.kimura_isEdited = true if self.wadoku.present?
  end
end
