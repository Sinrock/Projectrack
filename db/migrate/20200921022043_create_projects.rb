class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.integer :difficulty
      t.integer :duration
      t.string :tools
      t.string :parts
      t.string :location
      t.string :completion
      t.integer :cost
      
      t.timestamps null: false
    end
  end
end
