class Wadoku < ActiveRecord::Base
  attr_accessible :contents, :entry, :translation, :writing, :reading
  has_one :kimura
end
