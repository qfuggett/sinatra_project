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
    if logged_in?
      @exercise = current_user.exercises.find_by(id: params["id"])
      if @exercise 
        erb :'exercises/show'
      else
        redirect "/exercises"
      end
    else 
      redirect "/exercises"
    end
  end
  
   get '/exercises/:id/edit' do
    if logged_in?
      @exercise = current_user.exercises.find_by(id: params["id"])
      if @exercise
        erb :'exercises/edit'
      else
        redirect "/exercises"
      end
    else 
        redirect "/exercises"
    end
  end
  
  patch '/exercises/:id' do
    if logged_in?
      @exercise = current_user.exercises.find_by(id: params["id"])
      if @exercise
        @exercise.update(name: params["name"], duration: params["duration"], detail: params["detail"])
      
        redirect "/exercises/#{@exercise.id}"
      else 
        redirect "/exercises"
      end
    else 
      redirect "/exercises"
    end
  end
  
  delete '/exercises/:id/delete' do
    if logged_in?
      @exercise = current_user.exercises.find_by(id: params["id"])
      if @exercise
        @exercise.destroy
      
        redirect "/exercises"
      else 
        redirect "/exercises"
      end
    else 
      redirect "/exercises"
    end
  end

end