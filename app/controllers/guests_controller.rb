class GuestsController < ApplicationController
  before_filter :login_required
  def index
    #only lists the current hosts guests
    @guests = current_host.guests.all
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(params[:guest])
    #auto sets the current hosts id
    @guest.host_id = current_host.id
    if @guest.save
      redirect_to @guest, :notice => "Guest was successfully created."
    else
      render :action => 'new'
    end
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    @guest = Guest.find(params[:id])
    if @guest.update_attributes(params[:guest])
      redirect_to @guest, :notice  => "Successfully updated guest."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
    redirect_to guests_url, :notice => "Successfully destroyed guest."
  end
end
