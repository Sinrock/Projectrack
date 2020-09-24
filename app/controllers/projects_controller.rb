class ProjectsController < ApplicationController

get '/projects' do
    @projects = Project.all
    erb :'projects/index'
end

get '/projects/:id' do
    @project = Project.find(params[:id])
    erb :"/projects/show"
end
end