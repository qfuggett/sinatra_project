class ExercisesController < ApplicationController
  
  get '/exercises' do
    @exercises = Exercise.all
    erb :'/exercises/exercises'
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