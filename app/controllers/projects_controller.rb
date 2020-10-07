# frozen_string_literal: true

# Projects
class ProjectsController < ApplicationController
  get '/projects' do
    if logged_in
      @projects = current_user.projects
      erb :'projects/index'
    else
      flash[:error] = 'You must be signed in to view your projects!'
      redirect '/login'
    end
  end

  get '/projects/new' do
    if logged_in
      erb :'projects/new'
    else
      flash[:error] = 'Please log in or sign up before creating a post!'
      redirect '/'
    end
  end

  post '/projects' do
    project = Project.new(
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
    if project.save
      flash[:message] = 'Project has been created/edited successfully!'
      redirect "/projects/#{project.id}"
    else
      flash[:error] = "Project creation failed: #{project.errors.full_messages.to_sentence}"
      redirect '/projects/new'
    end
  end

  get '/projects/:id' do
    @project = Project.find(params[:id])
    erb :'/projects/show'
  end

  get '/projects/:id/edit' do
    @project = Project.find(params[:id])
    if can_edit(@project)
      erb :'/projects/edit'
    else
      flash[:error] = 'Sorry, you are not authorized to edit this post!'
      redirect '/projects'
    end
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
    flash[:message] = 'Project deleted successfully!'
    redirect '/projects'
  end
end
