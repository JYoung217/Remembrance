class Admin::GuestsController < ApplicationController
  def new
    @memorial = Memorial.find(params[:memorial_id])
    @exclude_ids = @memorial.guests.map(&:id)
    @users = User.where.not(id: @exclude_ids)
    @enlist_guests = MemorialGuest.new
  end

  def create
    guest_ids = params[:memorial_guest][:guest]
    guest_ids.pop
    @memorial = Memorial.find(params[:memorial_id])
    
    guest_ids.each do |guest_id|
      guest = User.find(guest_id)
      MemorialGuest.create(guest_id: guest.id, memorial_id: @memorial.id)
      InviteMailer.existing_email(guest, @memorial).deliver
    end
    redirect_to memorial_path(@memorial)
  end

  def invite_new_with_email
    @memorial = Memorial.find(params[:memorial_id])
  end

  def invite_create_with_email
    @memorial = Memorial.find(params[:memorial_id])
    emails = params[:email][:email].split(', ')
    emails.each do |email|
      existing_user = User.find_by(email_address: email)
      if existing_user
        @memorial.guests << existing_user
        InviteMailer.existing_email(existing_user, @memorial).deliver
      else
        Invite.create(email: email, memorial: @memorial)
        InviteMailer.invite_email(email, @memorial).deliver
      end
    end
    redirect_to memorial_path(@memorial)
  end
end