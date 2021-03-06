# frozen_string_literal: true

# Users
class UsersController < ApplicationController
  get '/login' do
    if logged_in
      flash[:message] = "You're already logged in silly goose!"
      redirect '/'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    user = User.find_by(email: params[:email])
    if user &.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:message] = "Welcome back #{user.name}!"
      redirect "/users/#{user.id}"
    else
      flash[:error] = 'Your credentials were invalid or no account exists with that email.  Please try again!'
      redirect '/login'
    end
  end

  get '/users/:id' do
    if (@user = User.find_by(id: params[:id]) && current_user)
      flash[:error] = 'You can only view your own account silly goose!'
      erb :'/users/show'
    else
      flash[:error] = 'You need to log in first silly goose!'
      redirect :'/login'
    end
  end

  get '/signup' do
    if logged_in
      flash[:message] = 'You already have an account silly goose!'
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
      flash[:error] = 'A user with that email address already exists, please log in!'
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    flash[:message] = 'You have been logged out successfully!'
    redirect '/'
  end

  delete '/users/:id' do
    user = User.find(params[:id])
    if user == current_user
      user.destroy
      flash[:message] = 'Account deleted successfully!'
      redirect '/'
    else
      flash[:error] = 'You are not authorized to delete that account!  Sneaky, Sneaky!'
      redirect 'users/show'
    end
  end
end
