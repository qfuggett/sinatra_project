class ExercisesController < ApplicationController
  
  get '/exercises' do
    #binding.pry
    @exercises = Exercise.all
    erb :'exercises/index'
  end
  
  get '/exercises/new' do
    
  end
  
  post '/exercises' do
    
  end
  
  get '/exercises/:id' do
    binding.pry
    @exercise = Exercise.find(params[:id])
    erb :'exercises/show'
  end
  
  patch '/exercises/:id' do
    
  end
end