# frozen_string_literal: true

require './config/environment'

# application
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'secret'
    register Sinatra::Flash
  end

  get '/' do
    if logged_in
      redirect "/users/#{current_user.id}"
    else
      erb :welcome
    end
  end

  helpers do
    def logged_in
      !!current_user
    end

    def current_user
      User.find_by(id: session[:user_id])
    end

    def can_edit(project)
      project.user == current_user
    end

    def redirect_if_logged_in
      return if logged_in

      flash[:error] = 'You must be signed in to do that!'
      redirect '/users/login'
    end
  end
end
