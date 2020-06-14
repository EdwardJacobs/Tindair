module UsersHelper
  def profile_thumbnail account
    cl_image_tag user.photos.first.key, width: '40px', height: '40px', class: 'profile-thumb rounded-circle mr-3' if user.photos.any?
  end
end
