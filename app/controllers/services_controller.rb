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
        if @service = Service.find_by(params)
            erb :'services/show'
        else
            redirect '/services'
        end
    end

    patch '/services/:id' do
        redirect_if_not_logged_in
        binding.pry
        @service = Service.find_by(params)
        # if is_not_blank?(params)
        #     @service.content = params[:content]
        #     @tweet.save
        #     redirect to "/tweets/#{@tweet.id}"
        # else
        #     redirect to "/tweets/#{@tweet.id}/edit"
        # end
      end


end