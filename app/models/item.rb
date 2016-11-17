class Item < ApplicationRecord
  belongs_to :directory
  has_many :comments, as: :commentable

  mount_uploader :file, FileUploader

  acts_as_taggable_on :labels

  accepts_nested_attributes_for :labels, reject_if: :all_blank, allow_destroy: true

  scope :for_user, ->(user) { joins(:directory).where(directories: { user_id: user.id }) }

end
