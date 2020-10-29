class Helpers
  
  def self.logged_in?(session)
    !!session[:user_id]
  end
  
  def self.current_user(session)
    @user = User.find(session[:user_id])
    @user
  end
    
    
end