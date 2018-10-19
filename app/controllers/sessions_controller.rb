class SessionsController < ApplicationController
  def new
  end

  def create
    # binding.pry
    return redirect_to '/sessions/new' if !params[:name] || params[:name].empty?
    session[:name] = params[:name]
    redirect_to '/'
  end
  def destroy
    session.delete :name
    redirect_to '/'
  end
end
