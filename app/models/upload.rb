class Upload < ActiveRecord::Base

  attr_accessible :gallery_id, :name, :image, :remote_image_url

  belongs_to :gallery
  belongs_to :user

  mount_uploader :image, ImageUploader

  def gallery_name
    @gallery_name ||= gallery.name
  end

  def user_name
    @user_name ||= user.try(:username)
  end

end
