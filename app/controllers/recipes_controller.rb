class RecipesController < ApplicationController
    get '/recipes/new' do 
        if !Helpers.is_logged_in?(session)
            redirect '/login'
        else
            erb :'/recipes/create_recipe'
        end 
    end 

    post '/recipes' do 
        if params.any?
            recipe = Recipe.create(title: params[:title], category: params[:category], description: params[:description], cook_time: params[:cook_time], prep_time: params[:prep_time],  ingredients: params[:ingredients], directions: params[:directions], servings: params[:servings], user_id: session[:user_id])
            redirect "/recipes/#{recipe.id}"
        else
            @error = 'You must fill in all fields correctly.'
            redirect '/recipes/new'
        end
    end 

    get '/recipes/:id' do
        @recipe = Recipe.find_by_id(params[:id])
        erb :'/recipes/view_recipe'
    end

    get '/recipes/:id/edit' do 
        if Helpers.is_logged_in?(session)
            @recipe = Recipe.find_by_id(params[:id])
            if Helpers.current_user(session) == @recipe.user
                erb :'/recipes/edit_recipe'
            else 
                redirect '/'
            end 
        else 
            redirect '/login'
        end
    end 

    patch '/recipes/:id' do 
        if !params.empty?
            @recipe = Recipe.find(params[:id])
            @recipe.title = params[:title]
            @recipe.description = params[:description]
            @recipe.category = params[:category]
            @recipe.prep_time = params[:prep_time]
            @recipe.cook_time = params[:cook_time]
            @recipe.servings = params[:servings]
            @recipe.ingredients = params[:ingredients]
            @recipe.directions = params[:directions]
            @recipe.save
            redirect "/recipes/#{params[:id]}"
        else
            redirect "/recipes/#{params[:id]}/edit"
        end

        redirect :"/recipes/#{params[:id]}"
    end 

    delete '/recipes/:id/delete' do
        @recipe = Recipe.find(params[:id])
        if Helpers.is_logged_in?(session)
            if Helpers.current_user(session) == @recipe.user
                @recipe = Recipe.find(params[:id])
                @recipe.destroy
                redirect "/profile"
            else
                redirect "/profile"
            end 
        else 
            redirect "/login"
        end
    end
end