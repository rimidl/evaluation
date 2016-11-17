class Item < ApplicationRecord

  belongs_to :directory

  mount_uploader :file, FileUploader

  acts_as_taggable_on :labels

  accepts_nested_attributes_for :labels, reject_if: :all_blank, allow_destroy: true

end
