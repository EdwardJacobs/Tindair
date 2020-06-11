class BrowseController < ApplicationController

  def browse
    liked_user_ids = Like.where(user_id: current_user.id).pluck(:liked_user_id)
    # add current user to array as to not display own photo
    liked_user_ids << current_user.id
    @users = User.includes(:photos_attachments).where.not(id: liked_user_ids).limit(10)
    # display all users while testing browser
    # @users = User.all
    @matches = current_user.matches
  end

  def match
    @matches = current_user.matches
  end

  def get_more_users
    # return next 10 users via ajax
  end

  def approve
    user_id = params[:id]
    # user swipes right
    logger.debug "User id for matching is #{params[:id]}"

    # create like for user
    new_like = Like.new(liked_user_id: user_id)
    new_like.user_id = current_user.id

    if new_like.save
      # check if user already likes us back
      existing_like = Like.where(user_id: user_id, liked_user_id: current_user.id).count
      @they_like_us = existing_like > 0
    else
      # issue saving like - return a warning message
    end
  end

  def decline
    # user swipes left
  end

  def open_conversation
    # remove @users and get @profile to work in view
    id = params[:id]
    @profile = User.find(id)
    likes = Like.where(user_id: current_user.id, liked_user_id: id)
    @match = likes.first if likes.size > 0

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
