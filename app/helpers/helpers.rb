require 'sinatra/base'

class Helpers 
    def self.valid_email?(email)
        email =~ /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,63}$/
    end

    def self.current_user(session)
       @user = User.find_by_id(session[:user_id])
    end

    def self.is_logged_in?(session)
        !!session[:user_id]
    end 
end 