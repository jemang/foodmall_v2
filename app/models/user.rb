class User < ApplicationRecord
  attr_accessor :login, :create_with_omniouth, :temp_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :validatable, :trackable,
         :rememberable, :registerable
        #  :recoverable, 

  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  validates :email, presence: :true, uniqueness: true

  enum role: [:normal_user, :staff]
  enum status: [:active, :deactive, :suspend]

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
  end
end
