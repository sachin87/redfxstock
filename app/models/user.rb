class User < ActiveRecord::Base

  attr_accessor :current_password

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :confirmable,
         :lockable, :timeoutable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :current_password

  #validates :username, uniqueness: true

  has_one :user_role, foreign_key: :user_id, class_name: 'UserRole', autosave: true
  has_one :role, through: :user_role
  has_one :profile
  has_many :uploads

  has_many :user_expertises, class_name: 'UserExpertise'
  has_many :expertises, through: :user_expertises

  letsrate_rater

  delegate :name, to: :role, :prefix => true
  before_create :set_role
  after_create do
    create_profile
  end

  before_update :has_role?

  acts_as_taggable

  Role::ROLE_HASH.each do |key, value|
    method_name = (key.to_s + '?').to_sym
    define_method(method_name) do
      role.name.downcase == value
    end
  end

  def moderator?
    super_admin? || admin?
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    # Uncomment the section below if you want users to be created if they don't exist
    # unless user
    #     user = User.create(name: data["name"],
    #        email: data["email"],
    #        password: Devise.friendly_token[0,20]
    #     )
    # end
    user
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end



  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  private

    def set_role
      build_user_role(role_id: Role.user_role.id)
    end

    def has_role?
      user_role.present?
    end

    def password_required?
      new_record? || password.present? || password_confirmation.present? ? super : false
    end

end
