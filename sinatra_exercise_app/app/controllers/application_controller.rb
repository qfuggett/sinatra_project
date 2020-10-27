require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    erb :index
  end
  
  get '/login' do
    erb :login
  end
  
  post '/login' do
    binding.pry
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/user"
    else
      redirect to "/error"
    end
  end
  
  get '/signup' do
    erb :signup
  end
  
  post '/signup' do
    @user = User.new(:username => params[:username], :password => params[:password])
		binding.pry
		if @user.save
      redirect "/login"
    else
      redirect "/error"
    end
  end
  
  get '/error' do
    erb :error
  end
  
  get '/logout' do 
    session.clear
    redirect "/"
  end
  
  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end
