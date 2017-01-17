class User < ApplicationRecord
  include BCrypt

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password_hash

  has_many :barks

  def index
  end

  # Return a BCrypt password or make a new one out of password_hash
  def password
    @password ||= Password.new(password_hash)
  end

  # Create a BCrypt password and set password_hash to equal the new BCrypt password
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  # Create a new user
  def create
    @user = User.new(params[:user])
    @user.password = params[:password_hash]
    @user.save!
  end

end
