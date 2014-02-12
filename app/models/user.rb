class User < ActiveRecord::Base

  attr_accessor :current_password

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :confirmable,
         :lockable, :timeoutable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :current_password

  validates :username, uniqueness: true

  has_one :user_role, foreign_key: :user_id, class_name: 'UserRole', autosave: true
  has_one :role, through: :user_role
  has_one :profile
  has_many :uploads

  delegate :name, to: :role, :prefix => true
  before_create :set_role
  before_update :has_role?

  Role::ROLE_HASH.each do |key, value|
    method_name = (key.to_s + '?').to_sym
    define_method(method_name) do
      role.name.downcase == value
    end
  end

  def moderator?
    super_admin? || admin?
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
