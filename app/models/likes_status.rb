class LikesStatus < ActiveRecord::Base
  belongs_to :like
  belongs_to :user
end
