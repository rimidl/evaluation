class Item < ApplicationRecord

  belongs_to :directory

  mount_uploader :file, FileUploader

end
