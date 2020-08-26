class ServicesController < ApplicationController

    get '/services' do
        redirect_if_not_logged_in
        @user = User.find_by(id: session[:user_id])
        @services = Service.all
        erb :'services/index'
    end

    get '/services/new' do
        redirect_if_not_logged_in
        erb :'services/new'
    end

    post '/services' do
        service = Service.new(params)
        service.user_id = session[:user_id]
        if service.save
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
        @service = Service.find_by(id: params[:id])
        if check_owner(@service)
          @service.update(params[:service])
        end
          erb :'services/show'
    end

    delete '/services/:id' do
        redirect_if_not_logged_in
        service = Service.find_by(id: params[:id])
        if check_owner(service)
            service.delete
        end
          redirect '/users/#{service.user_id}'
    end

end