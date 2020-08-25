class ServicesController < ApplicationController

    get '/services' do
        if logged_in?
            @user = User.find_by(params)
            erb :'services/index'
        else
            redirect to '/users/signup'
        end
    end

    get '/services/new' do
        redirect_if_not_logged_in
        erb :'services/new'
    end



end