class SessionsController < ApplicationController
  
    get '/login' do
      #binding.pry
      erb :'sessions/login'
    end
    
    post '/login' do
      binding.pry
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect to "/exercises"
      else
        redirect to "/welcome"
      end
    end
    
    get '/logout' do 
      session.clear
      redirect "/"
    end
    
    
end