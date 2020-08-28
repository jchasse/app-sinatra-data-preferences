class UsersController < ApplicationController

    get '/users/signup' do 
        if current_user
            flash[:message] = "Already a user."
            redirect to '/services'
        else
            erb :'/users/signup'
        end
    end

    post '/users/signup' do
        user = User.new(params)
        if user.save
            session[:user_id] = user.id
            flash[:message] = "Sign up successful."
            redirect to '/services'
        else
            flash[:message] = user.errors.full_messages.join(". ")
            redirect to '/users/signup'
        end
    end
   
    get '/users/login' do
        if current_user
            flash[:message] = "Already a user."
            redirect to '/services'
        else
            erb :'/users/login'
        end
    end

    post '/users/login' do
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect '/services'
        else
            flash[:message] = "Invalid input. Please re-enter."
            redirect '/users/login'
        end
    end

    get '/users/logout' do
        session.clear
        redirect to '/users/login'
    end

    get '/users/:id' do
        redirect_if_not_logged_in
        @user = User.find_by(params)
        if @user
            @services = @user.services
            erb :'users/show'
        else
            flash[:message] = "User does not exist."
            redirect '/services'
        end
      end

end

