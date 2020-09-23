class UsersController < ApplicationController
   
    get "/login" do
       erb :login
   end 
   
   post "/login" do
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/users/#{user.id}"
      else
        redirect "/login"
      end
   end

   get "/users/:id" do
     "This would be the users account page view!  Almost there, keep going!!!"
   end
end