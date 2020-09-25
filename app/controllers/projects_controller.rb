class ProjectsController < ApplicationController

get '/projects' do
    @projects = Project.all
    erb :'projects/index'
end

get "/projects/new" do
    erb :"projects/new"
end

post "/projects" do
    project = Project.create(
        title: params[:title],
        description: params[:description],
        difficulty: params[:difficulty],
        duration: params[:duration],
        tools: params[:tools],
        parts: params[:parts],
        location: params[:location],
        completion: params[:completion],
        cost: params[:cost],
        user_id: current_user.id
    )
    redirect "/projects/#{project.id}"
end

get '/projects/:id' do
    @project = Project.find(params[:id])
    erb :"/projects/show"
end

#update
    #edit button that takes us to the form
    #render an edit form
    #patch method/route that will update the projects

#delete
end