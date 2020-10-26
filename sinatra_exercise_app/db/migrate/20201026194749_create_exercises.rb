class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :duration
      t.string :detail
      t.datetime :exercise_time
      t.string :user_id
    end
  end
end
