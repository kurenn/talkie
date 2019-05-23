class CreateTalkieCommentsMigration < ActiveRecord::Migration[5.0]
  def change
    create_table :talkie_comments do |t|
      t.integer  :commentable_id
      t.string   :commentable_type
      t.text     :body, null: false
      t.datetime :deleted_at

      t.timestamps null: false
    end

    add_index :talkie_comments, [:commentable_id, :commentable_type]
  end
end
