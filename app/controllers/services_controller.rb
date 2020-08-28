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
            flash[:message] = service.errors.full_messages.join(". ")
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
        if obj_valid?(service)
          service.update(params[:service])
        elsif service
            flash[:message] = "You do not have permission to update."
        else
            flash[:message] = "This service does not exist."
        end
        redirect '/services'
    end

    delete '/services/:id' do
        redirect_if_not_logged_in
        service = Service.find_by(id: params[:id])
        if obj_valid?(service)
            service.delete
        elsif service
            flash[:message] = "You do not have permission to delete."
        else
            flash[:message] = "This service does not exist."
        end
        redirect '/services'
    end

end