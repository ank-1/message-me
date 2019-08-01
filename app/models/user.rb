class User < ApplicationRecord
  validates :username,presence: true,uniqueness: true,
            uniqueness: { case_sensitive: false },
            length:{minimum:4,maximum:15}
  has_secure_password
end
