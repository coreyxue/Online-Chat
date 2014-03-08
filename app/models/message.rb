class Message < ActiveRecord::Base
  attr_accessible :dialog_id, :message, :user_id
  belongs_to :user
  belongs_to :dialog
end
