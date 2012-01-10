class InvitationMailer < ActionMailer::Base
  default :from => "diiaann@gmail.com"
  
  def new_invitation_msg(inivitation)
    @invitation =  inivitation
    puts @invitation.guest.email
    mail(:to => @invitation.guest.email, :subject => "You've been invited!")
  end
  
  def new_gift_msg(gift)
    @gift =  gift
    mail(:to => @gift.invitation.guest.email, :subject => "Thank for you the gift!")
  end
end
