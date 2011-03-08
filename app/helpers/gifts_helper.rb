module GiftsHelper
  def get_invite_options
    Invitation.all.map{|invt|["#{invt.guest.name}",invt.id]}
  end
end
