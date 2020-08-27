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
            flash[:message] = "Saved successfully."
            redirect to "/services/#{service.id}"
        else
            binding.pry
            flash[:message] = service.errors.full_messages
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
            flash[:message] = "This service is not found. Please try another."
            redirect '/services'
        end
    end

    patch '/services/:id' do
        redirect_if_not_logged_in
        service = Service.find_by(id: params[:id])
        if check_owner(service)
          service.update(params[:service])
        else
            flash[:message] = "You do not have permission to update."
        end
          erb :'services/show'
    end

    delete '/services/:id' do
        redirect_if_not_logged_in
        service = Service.find_by(id: params[:id])
        if check_owner(service)
            service.delete
        else
            flash[:message] = "You do not have permission to update."
        end
          redirect '/users/#{service.user_id}'
    end

end