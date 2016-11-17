class DirectoryPermission < ApplicationRecord

  belongs_to :user
  belongs_to :directory

  validates :user, uniqueness: { scope: :directory, message: "should happen once per directory" }

end
