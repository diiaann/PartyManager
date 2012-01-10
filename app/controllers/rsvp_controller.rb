class RsvpController < ApplicationController
  
  
  def create
    invitation = Invitation.do_invite(:code,:attendees)
    if (inivtation.nil?)
      flash.now[:alert] = "Invalid invite code"
    end
    else
      flash.now[:alert] = "You have now RSVP'ed"
  end

end
