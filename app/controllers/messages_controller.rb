class MessagesController < ApplicationController 
	before_filter :authenticate_user!

	def index 
		conversation_partner_ids = current_user.conversation_partners.map { |partner| partner.id }
		
		@conversations = []
		p conversation_partner_ids
		conversation_partner_ids.each do |cpi|
			@conversations << Message.where('(user_id = ? AND recipient_id = ?) OR (user_id = ? AND recipient_id = ?)', current_user.id, cpi, cpi, current_user.id).order('id DESC')
		end
		p @conversations
		@conversations
	end


end 