require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end
  
  get '/' do
    erb :welcome
  end
  
  helpers do 
    def self.logged_in?(session)
      !!session[:user_id]
    end
    
    def self.current_user(session)
      @user = User.find(session[:user_id])
      @user
    end
  end
    
end
