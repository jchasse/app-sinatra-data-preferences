class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :home
  end
  
  helpers do
    def logged_in?
      !!session[:user_id]
    end
  
    def current_user
      User.find_by(id: session[:user_id])
    end

    def is_not_blank?(hash)
      !hash.values.find {|v| v == "" || v == " "} # False means user entered a blank
    end
    
    # insert more helper methods here
  end

end
