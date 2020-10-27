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
    
  end
  
  patch '/exercises/:id' do
    
  end
end