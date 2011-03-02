class InvitesController < ApplicationController
  # GET /
  def index
    id = params[:id]
    # Increment the number of clicks if it's not the user themselves
    if !id.nil? && (session[:user_id].nil? || id.to_i != session[:user_id].to_i)
      referrer = Invite.find(id)
      referrer.clicks += 1
      referrer.save
    end
    if !session[:user_id].nil?
      # If we have a cookie for the user, go ahead and set their instance
      @invite = Invite.find(session[:user_id])
    end
  end

  # POST /invites
  # POST /invites.xml
  def create
    @user_info = Hash.new
    @invite = Invite.find_by_email(params[:email])
    @user_info['new'] = false
    if @invite.nil? # User doesn't already exist
      @user_info['new'] = true
      if !params[:referrer].nil? #check for referrer
        begin
          referrer = Invite.find(params[:referrer])
          referrer.refer += 1
          referrer.save
        rescue
          puts "Bad input"
        end
      end
      @invite = Invite.new
      @invite.email = params[:email]
      @invite.save
    end
    # Set a cookie with the user's ID
    session[:user_id] = @invite.id
    # Set the URL to be shared
    @user_info['url'] = "http://" + request.env["HTTP_HOST"] + "/" + @invite.id.to_s(36)
  end
end
