class ConversationsController < ApplicationController

  def create
    @conversation = Conversation.new(conversation_params)
    @conversation.sender_id = current_user.id
    @conversation.messages.first.user_id = current_user.id

    if @conversation.save!
      logger.debug "conversation has been saved"
    else
      logger.debug "unable to save conversation"
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:recipient_id, message_attributes: [:body, :account_id])
  end
end
