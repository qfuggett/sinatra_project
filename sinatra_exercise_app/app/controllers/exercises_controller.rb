class ExercisesController < ApplicationController
  
  get '/exercises' do
    if logged_in?
      @exercises = current_user.exercises
      erb :'exercises/index'
    else
      erb :'welcome'
    end
  end

  post '/exercises' do
    @exercise = current_user.exercises.create(params)
    redirect "/exercises/#{@exercise.id}"
  end
  
  get '/exercises/:id' do
    #check if logged in, send back to index
    if logged_in?
      @exercise = current_user.exercises.find_by(id: params["id"])
    #add if not found, send back to index
      erb :'exercises/show'
    else redirect "/exercises/index"
    end
  end
  
   get '/exercises/:id/edit' do
        #check if logged in, send back to index
    if logged_in?
      @exercise = current_user.exercises.find_by(id: params["id"])
      erb :'exercises/edit'
    else redirect "/exercises/index"
    end
  end
  
  patch '/exercises/:id' do
        #check if logged in, send back to index
    if logged_in?
      @exercise = current_user.exercises.find_by(id: params["id"])
      @exercise.update(name: params["name"], duration: params["duration"], detail: params["detail"])
      
      redirect "/exercises/#{@exercise.id}"
    else redirect "/exercises/index"
    end
  end
  
  delete '/exercises/:id/delete' do
        #check if logged in, send back to index
    if logged_in?
      @exercise = current_user.exercises.find_by(id: params["id"])
      @exercise.destroy
      
      redirect "/exercises"
      
    else redirect "/exercises/index"
    end
  end
end