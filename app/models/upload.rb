class Upload < ActiveRecord::Base

  attr_accessible :gallery_id, :name, :image, :remote_image_url, :tag_list

  belongs_to :gallery
  belongs_to :user

  mount_uploader :image, ImageUploader

  letsrate_rateable :image

  before_create :default_name

  validates :image, :gallery_id, :tag_list, presence: true

  acts_as_taggable
  acts_as_commentable

  def default_name
    self.name ||= File.basename(image.filename, '.*').titleize if image
  end

  def gallery_name
    @gallery_name ||= gallery.name
  end

  def user_name
    @user_name ||= user.try(:username)
  end

end
