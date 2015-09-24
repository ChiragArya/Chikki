class MessagesController < ApplicationController

  before_action :authenticate_user!

  def new

  end

  def create
  	#find an array of users (stored in the params['recipients'])
    recipients = User.where(id: params['recipients'])
    #and utilize Mailboxer’s send_message method, passing in the recipients, body, and the subject
    conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end

end