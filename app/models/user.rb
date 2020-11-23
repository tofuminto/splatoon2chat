class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable,:trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:login]

  validates :nickname, presence: true, uniqueness: true, length: {maximum: 10}
  has_many :chats

  attr_writer :login

  def login
    @login || self.nickname || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(nickname) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:nickname)
      where(conditions.to_h).first
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(nickname) = :value", { :value => login.downcase }]).first
    else
      if conditions[:nickname].nil?
        where(conditions).first
      else
        where(nickname: conditions[:nickname]).first
      end
    end
  end

  def email_required?
    false
  end
  
  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

end
