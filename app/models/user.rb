class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews

  validates :password, presence: true
  validates :password_confirmation, presence: true
  validate :pw_confirmation_matches
  validates :password, length: { minimum: 5 }, allow_blank: false

  validates :name, presence: true

  validates :email, uniqueness: { case_sensitive: false }
  # validates :email, format: { with: /\A[a-z0-9]+\z/ }

  def pw_confirmation_matches
    if password != password_confirmation
      errors.add(:password_confirmation, "must match password")
    end
  end

  def self.authenticate_with_credentials(email, password)
    user = User.where("lower(email) = ?", email.strip.downcase).first
    if user.authenticate(password)
      return user
    else
      return nil
    end
  end

end
