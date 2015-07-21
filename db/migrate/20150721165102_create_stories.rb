class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :name
      t.text :content
      t.integer :user_id
      
      t.timestamps
    end
  end
end