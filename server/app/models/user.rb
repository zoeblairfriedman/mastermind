class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { minimum: 4 }
  # before_validation :name_is_lowercase, on: :create




  private

  def name_is_lowercase
      #logic to make it lowercase
  end

end
