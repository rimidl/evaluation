class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.integer :commentable_id
      t.string :commentable_type
      t.references :user, index: true
      t.string :ancestry, index: true
    end

    add_index :comments, %i(commentable_id commentable_type)
  end
end
