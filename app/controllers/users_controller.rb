class UsersController < ApplicationController
   
    get "/login" do
       erb :login
   end 


   post "/login" do
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
         
      else
        #show error
        redirect '/login'
      end
   end
end