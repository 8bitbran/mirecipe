class User < ActiveRecord::Base 
    has_many :recipes
    validates :username, uniqueness: true
    validates :username, presence: true
    has_secure_password
end