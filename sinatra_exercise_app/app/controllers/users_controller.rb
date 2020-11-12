class UsersController < ApplicationController
  
    get '/signup' do
      erb :'users/signup'
    end
    
    post '/signup' do
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      if @user.valid?
        @user.save
  		  session[:user_id] = @user.id
        redirect "/exercises"
      else
        render :signup
      end
    end
  
  end