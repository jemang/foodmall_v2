module DeviseExtended
  extend ActiveSupport::Concern

  included do
    attr_accessor :login, :create_with_omniouth, :temp_password
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :validatable, :trackable, :timeoutable,
           :rememberable, :registerable
        #  :recoverable,

    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
    end
  
  end
end