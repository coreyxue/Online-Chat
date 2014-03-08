class DialogsController < ApplicationController
  def create
  	if User.find_by_id params[:id]
  		#the other user exists
	  	dialogs = Dialog.where(:user1_id => current_user.id, :user2_id => params[:id])
	  	dialogs ||= Dialog.where(:user2_id => current_user.id, :user1_id => params[:id])
	  	if dialogs == []
	  		#dialog between user1 and user2 does not per-exist
	  		@dialog = Dialog.new(:user1_id => current_user.id, :user2_id => params[:id])
	  		@dialog.save
	  	else
	  		@dialog = dialogs[0]
	  	end
	  	redirect_to @dialog
	end
  end

  def show
  	@dialog = Dialog.find_by_id(params[:id])
  end
end
