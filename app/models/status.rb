class Status < ActiveRecord::Base
  # set up associations
  belongs_to :user
  has_and_belongs_to_many :likes, class_name: 'User', join_table: 'likes_statuses', dependent: :destroy
  has_and_belongs_to_many :followups, class_name: 'Status', join_table: 'followups_statuses', association_foreign_key: 'followup_id', dependent: :destroy
  validates :text, presence: true, length: { minimum: 1 }
end
