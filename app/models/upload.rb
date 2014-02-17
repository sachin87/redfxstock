class Upload < ActiveRecord::Base

  attr_accessible :gallery_id, :name, :image, :remote_image_url, :tag_list, :tag_tokens

  belongs_to :gallery
  belongs_to :user
  attr_reader :tag_tokens

  mount_uploader :image, ImageUploader
  before_create :default_name

  validates :image, :gallery_id, :tag_list, presence: true

  acts_as_taggable
  acts_as_commentable
  #letsrate_rateable "image", "name"

  def default_name
    self.name ||= File.basename(image.filename, '.*').titleize if image
  end

  def gallery_name
    @gallery_name ||= gallery.name
  end

  def user_name
    @user_name ||= user.try(:username)
  end

  def tag_tokens=(tokens)
    self.tag_list = Upload.ids_from_tokens(tokens)
  end

  def self.tokens(query)
    tags = ActsAsTaggableOn::Tag.where("name like ?", "%#{query}%")
    if tags.empty?
      [{id: "<<<#{query}>>>", name: "New: \"#{query}\""}]
    else
      tags
    end
  end

  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { ActsAsTaggableOn::Tag.create!(name: $1).name }
    tokens.split(',')
  end

end
