class BrowseController < ApplicationController

  def browse
    @users = User.where.not(id: current_user)
  end

  def approve
    logger.debug "User id for matching is #{params[:id]}"

  end

  def decline

  end

  private

end
