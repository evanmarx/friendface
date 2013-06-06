class MessagesController < ApplicationController 
	before_filter :authenticate_user!

	def index 
		if params[:user_id]
			partner_id = params[:user_id]

			@conversation = Message.where('(user_id = ? AND recipient_id = ?) OR (user_id = ? AND recipient_id = ?)', current_user.id, partner_id , partner_id , current_user.id).order('id DESC')
		else
			conversation_partner_ids = current_user.conversation_partners.map { |partner| partner.id }
			
			@conversations = []
			
			conversation_partner_ids.each do |cpi|
				@conversations << Message.where('(user_id = ? AND recipient_id = ?) OR (user_id = ? AND recipient_id = ?)', current_user.id, cpi, cpi, current_user.id).order('id DESC')
			end
		
			@conversations.sort_by! {|convo| convo.last.id }.reverse!
		end
	end


	def create
		@message = Message.new(params[:message])
		@message.user_id = current_user.id

		@message.save! 

	end

end 