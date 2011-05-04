class GiftsController < ApplicationController
  before_filter :login_required  
  def index
    @gifts = currentGifts()
  end
  #Gets the current gifts for the logged in host
  #Matches the inviations id of the current hosts since Ruby cannot do that my through relationships
  def currentGifts
    a = Array.new
    @currInvites = current_host.invitations.all
    for gft in Gift.all
      for invt in @currInvites
        if (invt.id==gft.invitation_id)
          a.push(gft)
        end
      end
    end
    return a
  end

  def show
    @gift = Gift.find(params[:id])
  end

  def new
    @gift = Gift.new
  end

  def create
    @gift = Gift.new(params[:gift])
    if @gift.save
      redirect_to @gift, :notice => "Successfully created gift."
    else
      render :action => 'new'
    end
  end

  def edit
    @gift = Gift.find(params[:id])
  end

  def update
    @gift = Gift.find(params[:id])
    if @gift.update_attributes(params[:gift])
      redirect_to @gift, :notice  => "Successfully updated gift."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @gift = Gift.find(params[:id])
    @gift.destroy
    redirect_to gifts_url, :notice => "Successfully destroyed gift."
  end
end
