class Post < ActiveRecord::Base
  mount_uploader :image, AvatarUploader
end
