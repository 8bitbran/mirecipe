class Recipe < ActiveRecord::Base 
    belongs_to :user

    def update_recipe(params)
        @title = params[:title]
        @description = params[:description]
        @category = params[:category]
        @prep_time = params[:prep_time]
        @cook_time = params[:cook_time]
        @servings = params[:servings]
        @ingredients = params[:ingredients]
        @directions = params[:directions]
    end 

    def total_time
        "#{@prep_time.to_i + @cook_time.to_i}"
    end 
end 