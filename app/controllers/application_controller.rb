class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
    register Sinatra::Flash
  end

  get "/" do
    erb :home
  end
  
  helpers do

    def current_user
      User.find_by(id: session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end

    def redirect_if_not_logged_in
      if !current_user
        flash[:message] = "You must log in to see that page"
        redirect '/users/login'
      end
    end

    def is_not_blank?(hash)
      !hash.values.find {|v| v == "" || v == " "} # False means user entered a blank
    end

    def check_owner(obj)
      obj.user == current_user
    end

    def obj_valid?(obj)
      obj && check_owner(obj)
    end

    # insert more helper methods here
  end

end
