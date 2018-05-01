class User < ActiveRecord::Base

  has_secure_password

  validates :password_confirmation, presence: true
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :name, presence: true
  validates :email, presence: true
  validates :password, :length => { minimum: 5 }


  def self.authenticate_with_credentials(email, password)
    raw_email = email.gsub(/\s+/, "").downcase
    user = User.find_by(email: raw_email)
      if (user.authenticate(password) == user)
        user
      else
        nil
      end
  end

end
