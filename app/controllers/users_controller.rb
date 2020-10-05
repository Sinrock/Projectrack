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
    erb :'/users/signup'
  end

  post '/users' do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      redirect "users/#{@user.id}"
    else
      flash[:error] = "Are you sure you don't have an account? A user with that email address already exists!"
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
