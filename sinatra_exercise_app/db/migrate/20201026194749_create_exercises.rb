class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :duration
      t.string :type
      t.string :user_id
    end
  end
end
