class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  has_many :dialogs,:foreign_key => 'user1_id'
  #has_many :dialogs,:foreign_key => 'user2_id'
  has_many :messages, :through => :dialogs

  has_secure_password

  before_save {|user| user.email=email.downcase}
  before_create :create_remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: {maximum: 50}

  validates :email, presence: true, 
  			format: {with: VALID_EMAIL_REGEX},
  			uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
