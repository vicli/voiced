class FriendshipController < ApplicationController
	def create
	  @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
	  if @friendship.save
	    flash[:notice] = "Followed Person."
	    redirect_to root_url
	  else
	    flash[:error] = "Unable to follow person."
	    redirect_to root_url
	  end
	end

	def destroy
	  @friendship = current_user.friendships.find(params[:id])
	  @friendship.destroy
	  flash[:notice] = "Stopped following."
	  redirect_to current_user
	end
	
end
