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

get '/projects/:id/edit' do
    @project = Project.find(params[:id])
    erb :'/projects/edit'
end

patch '/projects/:id' do
    @project = Project.find(params[:id])
    @project.update(
        title: params[:title],
        description: params[:description],
        difficulty: params[:difficulty],
        duration: params[:duration],
        tools: params[:tools],
        parts: params[:parts],
        location: params[:location],
        completion: params[:completion],
        cost: params[:cost]
    )
    redirect "/projects/#{@project.id}"
end

delete '/projects/:id' do
    @project = Project.find(params[:id])
    @project.destroy
    redirect '/projects'
end
end