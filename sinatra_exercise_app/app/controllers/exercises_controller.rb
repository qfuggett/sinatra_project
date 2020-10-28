class ExercisesController < ApplicationController
  
  get '/exercises' do
    #binding.pry
    @exercises = Exercise.all
    erb :'exercises/index'
  end
  
  get '/exercises/new' do
    
  end
  
  post '/exercises' do
    @exercise = Exercise.create(params)
    
    redirect "/exercises/#{@exercise.id}"
  end
  
  get '/exercises/:id' do
    binding.pry
    @exercise = Exercise.find(params[:id])
    erb :'exercises/show'
  end
  
  patch '/exercises/:id' do
    @exercise = Exercises.find_by(id: params["id"])
    @exercise.update(name: params["name"], duration: params["duration"], detail: params["detail"])
    
    redirect "/exercises/index"
  end
end