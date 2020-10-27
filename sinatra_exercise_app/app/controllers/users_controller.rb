class UsersController < Sinatra::Base
  
  get "/" do
      erb 'app/users/index'
    end
    
    get '/login' do
      erb :login
    end
    
    post '/login' do
      binding.pry
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect to "/index"
      else
        redirect to "/welcome"
      end
    end
    
    get '/signup' do
      erb :signup
    end
    
    post '/signup' do
      @user = User.new(:username => params[:username], :password => params[:password])
  		binding.pry
  		if @user.save
        redirect "/index"
      else
        redirect "/login"
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