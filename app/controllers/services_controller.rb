class ServicesController < ApplicationController

    get '/services' do
        if logged_in?
            @user = User.find_by(params)
            binding.pry
            erb :'services/index'
        else
            redirect to '/users/signup'
        end
    end
end