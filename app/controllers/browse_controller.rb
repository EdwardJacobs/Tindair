class BrowseController < ApplicationController

  def browse
    liked_user_ids = Like.where(user_id: current_user.id).map(&:liked_user_id)
    liked_user_ids << current_user.id
    # @users = User.where.not(id: liked_user_ids)
    @users = User.all
    @matches = current_user.matches
  end

  def matches
    @matches = current_user.matches
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

  private

end
