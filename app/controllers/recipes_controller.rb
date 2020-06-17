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
            if Helpers.current_user(session).id == @recipe.user_id
                erb :'/recipes/edit_recipe'
            else 
                redirect '/'
            end 
        else 
            redirect '/login'
        end
    end 

    patch '/recipes/:id' do 
        @recipe = Recipe.find_by_id(params[:id])
        @recipe.update_recipe(params)
        redirect :"/recipes/#{@recipe.id}"
    end 

    get '/myrecipes' do 
        if Helpers.is_logged_in?(session)
            @recipes = Recipe.all.select{|recipe| recipe.user_id == Helpers.current_user(session).id}
            erb :'/recipes/my_recipes'
        else 
            redirect '/'
        end
    end 

    delete '/recipes/:id' do
        @recipe = Recipe.find(params[:id])
        if Helpers.is_logged_in?(session)
            if Helpers.current_user(session).id == @recipe.user_id
                @recipe = Recipe.find(params[:id])
                @recipe.destroy
                redirect "/myrecipes"
            else
                redirect "/myrecipes"
            end 
        else 
            redirect "/login"
        end
    end
end