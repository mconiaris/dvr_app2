class App < ApplicationController
  # session NEW
  get('/') do
    if session[:current_user] # if there is a user set in the session
      redirect to("/viewer/#{session[:current_user][:id]}")
    else
      render(:erb, :'session/new')
    end
  end

  # session CREATE
  post('/session') do
    # look up the user by the name in params
    user = Viewer.find(name: params[:user_name])
    if user.nil? # if there was no user found with that name
      # flash is like session, except it only lasts for ONE MORE request!
      flash[:error] = "No user found with that name! Please sign in."
      redirect to('/')
    else
      # add a user to the session hash
      current_user_id = user.id
      session[:current_user]  = {id: current_user_id}
      redirect to("/viewer/#{current_user_id}")
    end
  end

  # session DELETE
  delete('/session') do
    # clear out the user from the session
    session[:current_user] = nil
    redirect to('/')
  end

  get('/viewer/new') do
    render(:erb, :'viewer/new')
  end

  # viewer SHOW
  get('/viewer/#{current_user_id}') do
    binding.pry
    @viewer = Viewer.find(id: params[:id])
    render(:erb, :'viewer/show')
  end

  post('/viewer') do
    Viewer.create(name: params["user_name"])
    # Add id to params to that viewers/:id will
    # render it.
    current_user_id = Viewer.find(name: params["user_name"]).id
    # I need to refresh this for it to work.
    redirect to("/viewer/#{current_user_id}"), 307
  end
end
