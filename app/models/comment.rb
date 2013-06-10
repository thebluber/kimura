class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :kimura
  attr_accessible :body, :user_id, :kimura_id
end
