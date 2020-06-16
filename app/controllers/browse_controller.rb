class BrowseController < ApplicationController

  def browse
    @matches = Match.matches_for(current_user.id)
    # @matches = Match.all
    @users = Match.recommended_matches_for(current_user.id)
    # @users = User.all
    @conversations = Conversation.includes(:messages).where("conversations.sender_id = ? OR conversations.recipient_id = ?", current_user.id, current_user.id)
  end



  def approve
    user_id = params[:id]
    logger.debug "User id for matching is #{params[:id]}"
    match = Match.between(user_id, current_user.id)
    if match.present?
      match = match.first
      if match.user_1 = current_user.id
        match.user_1_approves = true
      else
        match.user_2_approves = true
      end
    else
      match = Match.new(user_1: current_user.id, user_2: user_id, user_1_approves: true)
    end

    if match.save
      # show successful save
    else

    end
  end

  def decline
    # user swipes left
    user_id = params[:id]
    logger.debug "User id for matching is #{params[:id]}"
    match = Match.between(user_id, current_user.id)
    if match.present?
      match = match.first
      if match.user_1 = current_user.id
        match.user_1_approves = false
      else
        match.user_2_approves = false
      end
    else
      match = Match.new(user_1: current_user.id, user_2: user_id, user_1_approves: false)
    end

    if match.save
      # show successful save
    else

    end
  end

  def open_conversation
    # remove @users and get @profile to work in view
    id = params[:id]
    @profile = User.find(id)
    match = Match.between(current_user.id, id)
    @match = match.first if match.present?

    conversation = Conversation.between(id, current_user.id)

    @conversation = conversation.size > 0 ? conversation.first : Conversation.new
    @messages = @conversation.messages.includes(user: :photos_attachments) if @conversation.persisted?
    @message = @conversation.messages.build

    if @profile.present?

      respond_to do |format|

        format.js {
          render "browse/conversation"
        }

      end
    end

  end
end
