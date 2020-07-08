class User < ActiveRecord::Base 
    has_many :recipes
    validates :username, uniqueness: true
    validates :username, presence: true
    has_secure_password

    def self.new_with_validations(params)
        if valid_email?(params[:email]) && valid_username?(params[:username])
            user = User.new(params)
        end
    end

    def self.valid_email?(email)
        email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    end

    def self.valid_username?(username)
        username =~ /\A[a-z0-9_]{4,16}\z/
    end 
end