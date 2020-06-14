class RecipesController < ApplicationController
    get '/recipes/new' do 
        erb :'/recipes/create_recipe'
    end 

    post '/recipes' do 
        if params.any?
            recipe = Recipe.create(params)
            redirect "/recipes/#{recipe.id}"
        else
            @error = 'You must fill in all fields correctly.'
            redirect '/recipes/new'
        end
    end 

    get '/recipes/:id' do
        @recipe = Recipe.find_by_id(params[:id])
        erb :'recipes/view_recipe'
    end
end