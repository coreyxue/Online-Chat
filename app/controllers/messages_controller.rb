class MessagesController < ApplicationController
  def new
  	@message = Message.new
  end

  def create
  	@dialog = Dialog.find(params[:dialog_id])
  	@dialog.messages.create(:user_id => current_user.id, :message=>params[:message][:message])
  	redirect_to @dialog
  end
end
