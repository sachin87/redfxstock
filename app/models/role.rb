class Role < ActiveRecord::Base

  ROLE_HASH = { super_admin: 'super_admin', admin: 'admin',
                member: 'user', guest: 'guest' }

  attr_accessible :name

  validates :name, presence: true, uniqueness: true

  has_many :user_roles
  has_many :users, through: :user_roles

  class << self
    ROLE_HASH.values.each do |value|
      method_name = (value + '_role').to_sym
      define_method(method_name) do
        where(name: value).first
      end
    end
  end

end
