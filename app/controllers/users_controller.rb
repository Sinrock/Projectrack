class UsersController < ApplicationController
   
    get "/login" do
       erb :'users/login'
   end 

   post "/login" do
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/users/#{user.id}"
      else
        redirect "/users/login"
      end
   end

   get "/users/:id" do
     @user = User.find_by(id:params[:id])
     erb :'/users/show'
   end

   get '/signup' do
     erb :'/users/signup'
   end

   post '/users' do
     user = User.create(params)
     session[:user_id] = @user.id
     redirect "users/#{@user.id}"
   end

   get '/logout' do
     session.clear
     redirect '/'
   end
end