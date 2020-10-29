class ExercisesController < ApplicationController
  
  get '/exercises' do
    #binding.pry
    @user = User.find_by_id(session[:user_id])
    if @user
      @exercises = Exercise.all
      erb :'exercises/index'
    else
      erb :'welcome'
    end
  end
  
  get '/exercises/new' do
    
  end
  
  post '/exercises' do
    @exercise = Exercise.create(params)
    redirect "/exercises/#{@exercise.id}"
  end
  
  get '/exercises/:id' do
    binding.pry
    
    @exercise = Exercise.find_by(id: params["id"])
    erb :'exercises/show'
  end
  
   get '/exercises/:id/edit' do

    @exercise = Exercise.find_by(id: params["id"])
    erb :'exercises/edit'
  end
  
  patch '/exercises/:id' do
    binding.pry
    @exercise = Exercise.find_by(id: params["id"])
    @exercise.update(name: params["name"], duration: params["duration"], detail: params["detail"])
    
    redirect "/exercises/#{@exercise.id}"
  end
end