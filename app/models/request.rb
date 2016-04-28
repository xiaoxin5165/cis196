class Request < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  def getsender
    User.find(sender_id).name
  end

  def from
    User.find(sender_id)
  end

  def gettarget
    User.find(recipient_id)
  end
end
