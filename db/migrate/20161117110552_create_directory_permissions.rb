class CreateDirectoryPermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :directory_permissions do |t|
      t.integer :user_id
      t.integer :directory_id

      t.timestamps
    end
  end
end
