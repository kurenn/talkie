class CreateTalkieComments < ActiveRecord::Migration[5.0]
  def self.up
    create_table :talkie_comments do |t|
      t.string   :creator_type
      t.integer  :creator_id
      t.integer  :commentable_id
      t.string   :commentable_type
      t.text     :body, null: false
      t.integer  :parent_id
      t.integer  :lft
      t.integer  :rgt
      t.integer  :children_count, default: 0

      t.timestamps null: false
    end

    add_index :talkie_comments, :commentable_id
    add_index :talkie_comments, :commentable_type
    add_index :talkie_comments, [:creator_id, :creator_type],
              name: 'index_talkie_comments_on_creator_id_and_creator_type'

    create_table :talkie_subscriptions do |t|
      t.string   :subscriber_type, null: false
      t.integer  :subscriber_id, null: false
      t.integer  :comment_id, null: false

      t.timestamps null: false
    end

    add_index :talkie_subscriptions, [:subscriber_id, :subscriber_type, :comment_id],
      unique: true,
      name: 'index_talkie_subscriptions_on_s_id_and_s_type_and_c_id'

    add_index :talkie_subscriptions, :comment_id
  end

  def self.down
    drop_table :talkie_comments
  end
end
