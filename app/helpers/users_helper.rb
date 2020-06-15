module UsersHelper
  def profile_thumbnail(user)
    if user.photos.any?
    end
  end

  def get_user_from_conversation(conversation)
    matched_user_id = conversation.sender_id == current_user.id ? conversation.recipient_id : conversation.sender_id
    @matches.select { |user| user.id == matched_user_id }.first
  end
end
