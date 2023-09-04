module SpreeAdminRolesAndAccess
  module Spree
    module UserDecorator
      def self.prepended(base)
        base.alias_attribute :roles, :spree_roles
      end

      def can_access_admin_dashboard?
        return false unless roles

        roles.pluck(:admin_accessible).include?(true)
      end
    end
  end
end

::Spree::User.prepend SpreeAdminRolesAndAccess::Spree::UserDecorator
