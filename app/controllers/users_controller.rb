class UsersController < ApplicationController

    get '/users/signup' do
        if current_user
            redirect to '/services'
        else
            erb :'/users/signup'
        end
    end

    post '/users/signup' do
        user = User.new(params)
        if user.save
            session[:user_id] = user.id
            redirect to '/services'
        else
            raise "Need to enter error here around unable to save due to blank entered or not uniq"
            redirect to '/users/signup'
        end
    end
   
    get '/users/login' do
        if current_user
            redirect to '/services'
        else
            erb :'/users/login'
        end

    end


    get '/users/logout' do
        session.clear
        redirect to '/users/login'
    end



end

