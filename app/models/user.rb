class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :confirmable,
         :lockable, :timeoutable and :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :username

  has_one :user_role, foreign_key: :user_id, class_name: 'UserRole', autosave: true
  has_one :role, through: :user_role

  delegate :name, to: :role, :prefix => true
  before_create :set_role
  before_update :has_role?

  Role::ROLE_HASH.each do |key, value|
    method_name = (key.to_s + '?').to_sym
    define_method(method_name) do
      role.name.downcase == value
    end
  end

  private

    def set_role
      build_user_role(role_id: Role.user_role.id)
    end

    def has_role?
      user_role.present?
    end

end
