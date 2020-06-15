module UsersHelper
  def profile_thumbnail(user)
    if user && user.photos.any?
      cl_image_tag user.photos.first.key, width: '40px', height: '40px', class: 'profile-thumb rounded-circle mr-3' if @users.photos.any?
    end
  end

  def get_user_from_conversation(conversation)
    matched_user_id = conversation.sender_id == current_user.id ? conversation.recipient_id : conversation.sender_id
    @matches.select { |user| user.id == matched_user_id }.first
  end
end
