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

    post '/services/new' do
        service = Service.new(params)
        binding.pry
        if service.save
            service.user_id = session[:user_id]
            redirect to "/services/#{service.id}"
        else
            #need to add error messaging
            redirect to "services/new"
        end
    end



end