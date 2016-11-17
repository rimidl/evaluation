class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :file
      t.integer :directory_id

      t.timestamps
    end
  end
end
