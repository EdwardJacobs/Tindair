class BrowseController < ApplicationController

  def browse
    @users = User.where.not(id: current_user)
  end

  def accept

  end

  def decline

  end

  private

end
