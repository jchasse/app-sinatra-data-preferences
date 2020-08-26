class ServicesController < ApplicationController

    get '/services' do
        redirect_if_not_logged_in
        @user = User.find_by(id: session[:user_id])
        erb :'services/index'
    end

    get '/services/new' do
        redirect_if_not_logged_in
        erb :'services/new'
    end

    post '/services' do
        service = Service.new(params)
        if service.save
            service.user_id = session[:user_id]
            redirect to "/services/#{service.id}"
        else
            #need to add error messaging
            redirect to "services/new"
        end
    end

    get '/services/:id/edit' do
        redirect_if_not_logged_in
        @service = Service.find_by(params)
        erb :'services/edit'
    end

    get '/services/:id' do
        redirect_if_not_logged_in
        if @service = Service.find_by(id: params[:id])
            erb :'services/show'
        else
            redirect '/services'
        end
    end

    patch '/services/:id' do
        redirect_if_not_logged_in
        binding.pry
    end

    delete '/services/:id' do
        redirect_if_not_logged_in
        service = Service.find_by(id: params[:id])
        if check_owner(item)
            service.delete
        else
          redirect '/services'
        end
    end

end