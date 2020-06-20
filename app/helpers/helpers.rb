require 'sinatra/base'

class Helpers 
    def self.valid_email?(email)
        email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    end

    def self.valid_username?(username)
        username =~ /\A[a-z0-9_]{4,16}\z/
    end 

    def self.current_user(session)
        User.find_by(id: session[:user_id])
    end

    def self.is_logged_in?(session)
        !!session[:user_id]
    end 
end 