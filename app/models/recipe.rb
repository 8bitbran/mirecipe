class Recipe < ActiveRecord::Base 
    belongs_to :user
    
    def total_time
        "#{@prep_time.to_i + @cook_time.to_i}"
    end 
end 