class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :category
      t.integer :prep_time
      t.integer :cook_time
      t.integer :rating
    end 
  end
end
