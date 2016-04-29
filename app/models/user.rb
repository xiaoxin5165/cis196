require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  # validate stuff
  # all my relations
  has_many :statuses, dependent: :destroy
  has_and_belongs_to_many :replies, class_name: 'Status', join_table: 'users_statuses', dependent: :destroy
  has_many :incomingrequests, class_name: 'Request', foreign_key: 'recipient_id'
  has_many :outgoingrequests, class_name: 'Request', foreign_key: 'sender_id'
  has_and_belongs_to_many :friends, class_name: 'User', join_table: 'friends_users', association_foreign_key: 'friend_id'
  has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: %r{\Aimage\/.*\Z}
  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :email, presence: true
  validates :password, presence: true
  validate :namecheck

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def namecheck
    errors.add(:name, ' is not capitalized') if name.scan(/^[A-Z]/).empty?
  end
end
