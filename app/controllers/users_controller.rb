# frozen_string_literal: true

# Controls the user's flow from login to logout
class UsersController < ApplicationController
  # shows the login form page
  get '/login' do
    erb :'users/login'
  end

  # takes in the params from the login form
  post '/login' do
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:message] = "Welcome back #{user.name}"
      redirect "/users/#{user.id}"
    else
      flash[:error] = 'Your credentials were invalid.  Please try again!'
      redirect '/login'
    end
  end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :'/users/show'
  end

  get '/signup' do
    erb :'/users/signup'
  end

  post '/users' do
    @user = User.create(params)
    session[:user_id] = @user.id
    redirect "users/#{@user.id}"
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
