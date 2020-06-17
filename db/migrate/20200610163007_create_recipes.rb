class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.string :category
      t.integer :servings
      t.text :ingredients
      t.text :directions
      t.integer :prep_time
      t.integer :cook_time
    end 
  end
end
