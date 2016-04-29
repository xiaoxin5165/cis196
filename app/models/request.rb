class Request < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  def getsender
    # get the name
    User.find(sender_id).name
  end

  def from
    # get the sender instance
    User.find(sender_id)
  end

  def gettarget
    # get the target instance
    User.find(recipient_id)
  end
end
