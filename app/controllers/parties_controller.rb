class PartiesController < ApplicationController
  before_filter :login_required
  def index
    #lists only the logged in hosts parties
    @parties = current_host.parties.all
    
  end
  
  
  def email
    @party = Party.find(params[:id])
    for invite in current_host.invitations.all
      if (@party.id == invite.party_id)
        InvitationMailer.new_invitation_msg(invite).deliver
      end
    end
  end
  
  
  def show
    @party = Party.find(params[:id])
    @current_guests = @party.guests.all
  end

  def new
    @party = Party.new
  end

  def create
    @party = Party.new(params[:party])
    #sets the host_id to the logged in hosts id
    @party.host_id = current_host.id
    if @party.save
      redirect_to @party, :notice => "Successfully created party."
    else
      render :action => 'new'
    end
  end

  def edit
    @party = Party.find(params[:id])
  end

  def update
    @party = Party.find(params[:id])
    if @party.update_attributes(params[:party])
      redirect_to @party, :notice  => "Successfully updated party."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @party = Party.find(params[:id])
    @party.destroy
    redirect_to parties_url, :notice => "Successfully destroyed party."
  end
end
