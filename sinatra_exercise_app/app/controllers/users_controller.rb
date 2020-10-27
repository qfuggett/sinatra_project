class UsersController < Sinatra::Base
  
    get "/" do
      erb :'welcome'
    end
    
    get '/login' do
      erb :'/sessions/login'
    end
    
    post '/login' do
      binding.pry
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect to "/users/index"
      else
        redirect to "/welcome"
      end
    end
    
    get '/signup' do
      erb :'/users/signup'
    end
    
    post '/signup' do
      @user = User.new(:username => params[:username], :password => params[:password])
  		binding.pry
  		if @user.save
        redirect "/users/index"
      else
        redirect "/sessions/login"
      end
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