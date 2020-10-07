# frozen_string_literal: true

class UsersController < ApplicationController
  get '/login' do
    if logged_in
      flash[:message] = "You're already logged in silly goose!"
      redirect 'users/show'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    user = User.find_by(email: params[:email])
    if user &.authenticate(params[:password])
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
    if logged_in
      flash[:message] = "You already have an account silly goose!"
      redirect '/'
    else
      erb :'/users/signup'
    end
  end

  post '/users' do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "Account Creation Successful!  Welcome, #{@user.name}"
      redirect "users/#{@user.id}"
    else
      flash[:error] = "A user with that email address already exists, please log in!"
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    flash[:message] = "You have been logged out successfully!"
    redirect '/'
  end
end
