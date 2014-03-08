class Dialog < ActiveRecord::Base
  attr_accessible :user1_id, :user2_id
  belongs_to :user_1, :class_name => "User", :foreign_key => 'user1_id'
  belongs_to :user_2, :class_name => "User", :foreign_key => 'user2_id'
  has_many :messages
end
