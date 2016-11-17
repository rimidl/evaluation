class Directory < ApplicationRecord

  has_many :items, dependent: :restrict_with_error

  has_many :directory_permissions
  has_many :linked_users, class_name: 'User', through: :directory_permissions

  belongs_to :user

  accepts_nested_attributes_for :directory_permissions, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true

end
