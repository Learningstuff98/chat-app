class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :chatroom_id
      t.timestamps
    end
    add_index :comments, :chatroom_id
  end
end
