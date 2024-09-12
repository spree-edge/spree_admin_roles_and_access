module Spree
  class PermissionSet < ActiveRecord::Base
    has_many :permissions_permission_sets, dependent: :destroy
    has_many :permissions, through: :permissions_permission_sets
    has_many :roles_permission_sets, dependent: :destroy
    has_many :roles, through: :roles_permission_sets

    validates :name, presence: true, uniqueness: true
    validates :permissions, length: { minimum: 1, too_short: Spree.t(:atleast_one_permission_is_required) }, on: :update

    def self.ransackable_attributes(auth_object = nil)
      ["created_at", "description", "display_permission", "id", "id_value", "name", "updated_at"]
    end
  end
end
