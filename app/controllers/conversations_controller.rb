class ConversationsController < ApplicationController
	before_action :authenticate_user!
  	before_action :get_mailbox
  	before_action :get_conversation, except: [:index]

  	def show
  		
  	end

	#Every user has its own mailbox(inbox, sentbox, and trash). Currently we are working only with the inbox.
	def index
		@conversations = @mailbox.inbox.paginate(page: params[:page], per_page: 10)
	end

	private
	def get_mailbox
		# a ||= b   <-- means a = a || b (a = a or b)
		@mailbox ||= current_user.mailbox
	end

	def get_conversation
		#find method raises an exception when no record is found
		@conversation ||= @mailbox.conversations.find(params[:id])
	end

end
