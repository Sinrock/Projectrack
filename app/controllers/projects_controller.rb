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
      flash[:message] = "#{project.title} has been saved successfully!"
      redirect "/projects/#{project.id}"
    else
      flash[:error] = "Project creation failed: #{project.errors.full_messages.to_sentence}"
      redirect '/projects/new'
    end
  end

  get '/projects/:id' do
    @project = Project.find_by(id: params[:id])
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
    if can_edit(@project)
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
    else
      flash[:error] = 'You are not authorized to view that content.  Sneaky, Sneaky!'
      redirect '/projects'
    end
  end

  delete '/projects/:id' do
    @project = Project.find(params[:id])
    if can_edit(@project)
      flash[:message] = "#{@project.title} has been deleted successfully!"
      @project.destroy
      redirect '/projects'
    else
      flash[:error] = 'You are not authorized to delete that project!  Sneaky, Sneaky!'
      redirect "/projects/#{@project.id}"
    end
  end
end
