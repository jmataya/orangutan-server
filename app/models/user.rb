class User < ActiveRecord::Base
  attr_accessible :email, :name

  before_save { |user| user.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 256 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  		uniqueness: { case_sensitive: false }

  def to_json(object)
  	json_encoder = ActiveSupport::JSON
  	json_encoder.encode({ id: self.id, name: self.name, email: self.email })
  end
end
