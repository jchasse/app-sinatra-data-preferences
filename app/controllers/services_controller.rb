class ServicesController < ApplicationController

    get '/services' do
        if logged_in?
            erb :'services/index'
        else
            redirect to '/users/signup'
        end
    end
end